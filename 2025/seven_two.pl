#!/usr/bin/perl

use strict;
use warnings;

my $split_count = 0;

my $first_line = <>;
chomp($first_line);

my @tachyons = 0 x length($first_line);

$tachyons[index($first_line, 'S')] = 1;

while (my $line = <>) {
    for (my $index = 0; ($index = index($line, '^', $index)) >= 0; $index++) {
        my $beam_count = $tachyons[$index];
        if ($beam_count > 0) {
            $split_count += $beam_count;

            $tachyons[$index] = 0;
            $tachyons[$index-1] += $beam_count;
            $tachyons[$index+1] += $beam_count;
        }
    }
}

print "Timeline Count: ", $split_count + 1, "\n";
