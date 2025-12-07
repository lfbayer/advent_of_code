#!/usr/bin/perl

use strict;
use warnings;

my $ranges = ();

while (my $line = <>) {
    chomp($line);

    last if ($line eq '');

    my ($start, $end) = $line =~ /(\d+)-(\d+)/;

    push(@$ranges, {
        start => $start,
        end => $end
    });
}

my $fresh_count = 0;
while (my $line = <>) {
    chomp($line);

    print "Testing $line\n";
    foreach my $range (@$ranges) {
        if ($line >= $range->{start} && $line <= $range->{end}) {
            $fresh_count++;
            last;
        }
    }
}

print "Fresh: $fresh_count\n";
