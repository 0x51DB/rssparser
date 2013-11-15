#! /bin/perl
# download the feeds from the sourcefile to the rss directory.

use feature ':5.10';
use LWP::Simple;

system("./clearfeeds.pl");

open my $sourcefile, 'sourcefile' or die 'Source file was not read';

$count = 0;

foreach $sourceline (<$sourcefile>)
{
    system("wget -O rss/rss".$count." ".$sourceline);
    $count = $count + 1;
}

close $sourcefile;

