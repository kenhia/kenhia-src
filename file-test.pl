#!/usr/bin/perl -w
use strict;

if (@ARGV != 1) {
    print "usage: file-test.pl <file-dir-name>\n";
    exit(0);
}

my $file = $ARGV[0];

print "$file      EXISTS : " . (-e $file) . "\n";
print "$file    READABLE : " . (-r $file) . "\n";
print "$file   WRITEABLE : " . (-w $file) . "\n";
print "$file   DIRECTORY : " . (-d $file) . "\n";
print "$file NORMAL FILE : " . (-f $file) . "\n";
print "$file   TEXT FILE : " . (-T $file) . "\n";
print "$file BINARY FILE : " . (-B $file) . "\n";
print "\n";

