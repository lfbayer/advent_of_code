#!/usr/bin/perl

use strict;
use warnings;

my $invalid_sum = 0;
while (my $line = <>) {
    while ($line =~ /(\d+)-(\d+),?/g) {
        my $start = $1;
        my $end = $2;

        print "Handling range '$start-$end'\n";
        for my $id ($start .. $end) {
            # print $id, "\n";

            if ($id =~ /^(\d+)\1+$/) {
                print "Invalid: $id\n";
                $invalid_sum += $id;
            }
        }
    }
}

print "Sum: $invalid_sum\n";
