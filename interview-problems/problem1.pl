#!/usr/bin/perl -w
use strict;
use warnings;

my $argc = $#ARGV + 1;
my $usage = "disney.pl <k> <a1>..<an>";
my $description = "Looks for pairs such that a[x] + a[y] = k";

die "$usage\n\t$description\n" if ($argc < 3);

foreach (@ARGV){
    if (!(/^-?\d+\z/))       { die "$_ is not an integer\n" }
}

my $k = $ARGV[0];
my @a = @ARGV[1..$#ARGV];

# sort numerically ascending
@a = sort {$a <=> $b} @a;

# set indicies to extremes of array
my $left = 0;
my $right = $#a;
my $count = 0;

# note: < instead of <= as we want pairs, not the same index twice
while ( $left < $right ) {
    my $t = $a[$left] + $a[$right];
    
    if ($t == $k) { # found a pair that satisfies
        print "($a[$left], $a[$right])\n";
        $count++;
        if ($a[$right] == $a[$right-1]) {
            $right--;
        } else {
            if ($a[$left] == $a[$left+1]) {
                # may need to 'rewind' $right to get all the duplicate looking pairs
                while (($right != $#a) and ($a[$right] == $a[$right+1])){
                    $right++;
                }
            }
            $left++;
        }
    } else {
        if ($t < $k) { $left++; }
        else { $right--; }
    }
}
print "Found $count pairs that sum to $k\n";