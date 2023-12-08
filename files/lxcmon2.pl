#!/usr/bin/perl

use strict;

# > ls /var/lib/lxc
# cnode1/  cnode2/  cnode3/  cnode4/  cnode5/

my @nodes = `ls /var/lib/lxc`;

for (@nodes)
{
  chomp $_;

  my $mac = `grep hwaddr /var/lib/lxc/$_/config|grep -v '#'`;
  $mac =~ s/.*?=\s+(.*?)/$1/;

  print "Name:\t\t$_\n";
  print `lxc-info -n $_ -is`;
  print "MAC Addr:\t$mac\n";
}
