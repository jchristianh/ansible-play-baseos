#!/bin/bash

echo "Which environment to test? (centos9, fedora39, debian11, debian12)"
read test_environment

CNAME="testing-${test_environment}"
IMG_TAG="release"

podman pull gitea.thezengarden.net/podman/ansible-dev/${test_environment}:${IMG_TAG}

podman run -ti --rm --name ${CNAME} --hostname ${CNAME} \
  --cap-add SYS_ADMIN --uts=private \
  -v /home/chris/Development/Ansible/Plays/baseos:/opt/ansible/baseos \
  -v /home/chris/Development/Ansible/Collections/jchristianh/baseos:/opt/ansible/baseos/collections/ansible_collections/jchristianh/baseos \
  gitea.thezengarden.net/podman/ansible-dev/${test_environment}:${IMG_TAG} \
  /bin/bash
