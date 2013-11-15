#! /bin/perl
# append feeds to the source file. Feeds are given as command line arguments

use feature ':5.10';

open my $sourcefile, '>>', 'sourcefile' or die 'Source file was not accessed';

foreach my $args (@ARGV)
{
    say $sourcefile $args
}

close $sourcefile;
