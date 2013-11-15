rssparser
=========

This is a set of basic scripts to collect articles by parsing rss feeds.
The purpose of this project is to create command-line scripts that have
the same general purpose as a standard RSS-based news aggregator.

My main goal in developing this project is to learn the basics of Perl
and build a simple tool for archiving news stories.

The tools should be usable on any POSIX-compliant system with bash, Perl,
and wget.

News sources are stored in the source file, which lists links to each RSS
feed.

addfeed.pl appends new rss sources to the source file.
cleararticles.pl and clearfeeds.pl will clean their respective directories.
getfeeds.pl downloads the rss feeds from each source into the rss directory.
parsefeeds.pl will search each rss feed and add a file in the
articles directory corresponding to each article it parses.
