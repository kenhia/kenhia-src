#!/usr/bin/perl
use strict;
use warnings;

print "Hello World!\n";

my $my_var;
$my_var = 1;
undef $my_var;
$my_var = undef;
if (defined($my_var)) {
    print "\$my_var is defined\n";
} else {
    print "\$my_var is undefined\n";
}