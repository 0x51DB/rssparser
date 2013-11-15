#! /bin/perl
# This will parse feeds in directory rss to get articles
# Articles will be plased in directory articles

use feature ':5.10';

# Find all files in rss directory
opendir(RSSDir, "rss");
my @rssfiles = readdir(RSSDir);
closedir(RSSDir);

# Count the number of articles, for naming purposes
opendir(ArticlesDir, "articles");
my @articlefiles = readdir(ArticlesDir);
closedir(ArticlesDir);
$acount = -2;
foreach my $articlefile (@articlefiles)
{
$acount = $acount + 1;
}

# Read through each rss file
foreach my $rssfile (@rssfiles)
{
    # Do not read . or ..
    next if($file =~ /^\.$/);
    next if($file =~ /^\.\.$/);

    # Open a file, and parse it
    open $filehandle, "rss/".$rssfile or die 'Could not open one of the rss files';
    
    # Get all contents as single string
    my $aggregate = "";
    while(<$filehandle>)
    {
        $aggregate = $aggregate.$_;
    }
    
    close $filehandle;

    # Split into xml items
    @items = split('<item>', $aggregate);
    
    # Parse the xml items
    $count = -1;
    foreach my $item (@items)
    {
        $count = $count + 1;
        # The first item is the header; ignore it
        next if ($count == 0);

        # We want the following information about the article: 
        #   # Title, date, source, content
        # Output will be an article with information given in that order
        # XML tags should be removed, as should escape characters
        open my $article, '>', "articles/article".($acount + $count) or die 'Could not create an article';
        my @title = split('<title>',$item);
        @title = split('<\/title>',$title[1]);
        say $article $title[0];

        my @date = split('<pubDate>', $item);
        @date = split('<\/pubDate>', $date[1]);
        say $article $date[0];

        my @source = split('<link>', $item);
        @source = split('<\/link>', $source[1]);
        say $article $source[0];

        # The Title, date, and source link have been parsed
        # This leaves the difficult part, finding the actual raw text content

        close $article;
    }
}
