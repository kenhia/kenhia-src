#!/usr/bin/perl -w
use strict;

# sub declares
sub trim($);
sub ltrim($);
sub rtrim($);


if (!(defined $ARGV[0])) {
    print "usage: extract.mylibrary.pl <html-file>\n";
    exit(0);
}
if (!(-r $ARGV[0])) {
    print "$ARGV[0] doesn't appear to be a readable file. Ack! Phwt!\n";
    exit(1);
}

my $filename = $ARGV[0];

print "$filename...we should contemplate it\n";

open SRCFILE, "<$filename";
my @src;
@src = <SRCFILE>;
close SRCFILE;

#@src = chomp(@src);

my $lines = @src + 1;
print "$filename has $lines lines\n";

my $tmp;
my $len;
my @src2;

foreach (@src) {
    chomp;
    print "::" . $_ . "::\n";
    $tmp = trim($_);
    if ((length $tmp) > 0) {
        $src2[@src2] = $tmp;
        $len = length $tmp;
        print "--" . $tmp . "--[$len]\n";
    }
}

$lines = @src2 ;
print "src2 has $lines lines\n";
my $dashline = '-----------------------------------------------------------------------------';
my $cnt = 0;
print "$dashline\n";
foreach (@src2) {
    $cnt++;
    print "$cnt: $_\n";
}
print "$dashline\n";



# -----------------------------------------------------------------------------
# Perl trim function to remove whitespace from the start and end of the string
sub trim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}
# Left trim function to remove leading whitespace
sub ltrim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	return $string;
}
# Right trim function to remove trailing whitespace
sub rtrim($)
{
	my $string = shift;
	$string =~ s/\s+$//;
	return $string;
}
