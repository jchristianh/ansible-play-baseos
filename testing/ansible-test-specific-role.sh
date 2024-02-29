#!/bin/bash

ansible-playbook -v -i localhost, --connection=local baseos.yml -e baseos_include_roles="['jchristianh.baseos.node_status','jchristianh.baseos.hostname']"
