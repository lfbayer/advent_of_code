#!/usr/bin/perl

use strict;
use warnings;



my $split_count = 0;

my $first_line = <>;
chomp($first_line);

my @tachyons = 0 x length($first_line);

$tachyons[index($first_line, 'S')] = 1;

while (my $line = <>) {
    print "$line";
    my $index = 0;
    while (($index = index($line, '^', $index)) >= 0) {
        print("Index: $index\n");
        if ($tachyons[$index]) {
            $split_count++;

            $tachyons[$index] = 0;
            $tachyons[$index-1] = 1;
            $tachyons[$index+1] = 1;
        }

        $index++;
    }
}

print "Split Count: $split_count\n";
