#! /bin/perl
# Purges the rss directory to remove old feeds.

use feature ':5.10';

system("rm -R rss");
system("mkdir rss");

