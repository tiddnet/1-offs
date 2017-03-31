#!/usr/bin/perl

use strict;
use File::Path qw(remove_tree);

my $count = 0;

# Change this to match the path that contains the hashes you wish to remove.
my $mypath = '/u/data/wit-backend/image_cache';  

open (LOG, "> removeHashes.log");

while ($count < 256) {
    my $myline = "";

    my $hex = sprintf("%0.1x", $count);

    if ( length $hex > 1 ) {
    
        $myline = $hex;
  
    }else{

        $myline = "0$hex";

    }
 
    $count++;

    print $myline . "\n";

    if (-d "$mypath/$myline") {

       print LOG "Removing $mypath/$myline\n";     
       remove_tree( "$mypath/$myline" );
       sleep 10;  # Only sleep if we actually did work.

    }else{

       print LOG "Directory path $mypath/$myline does not exist\n";     

    }

}

close LOG;
