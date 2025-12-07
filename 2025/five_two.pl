#!/usr/bin/perl

use strict;
use warnings;

my @ranges = ();

while (<>) {
    last unless (my ($start, $end) = /(\d+)-(\d+)/);

    push(@ranges, { start => $start, end => $end });
}

my @sorted_ranges = sort { $a->{start} <=> $b->{start} } @ranges;

my @merged_ranges = ();
my $current_range = $sorted_ranges[0];
print "Adding ", $current_range->{start}, '-', $current_range->{end}, "\n";
push(@merged_ranges, $current_range);

foreach my $i (1 .. $#sorted_ranges) {
    my $range = $sorted_ranges[$i];
    if ($range->{start} <= $current_range->{end}) {
        if ($range->{end} <= $current_range->{end}) {
            print "Skipping ", $range->{start}, '-', $range->{end}, "\n";
            next;
        }

        print "Expanding\n";
        print "  ", $current_range->{start}, '-', $current_range->{end}, "\n";
        print "  ", $current_range->{start}, '-', $range->{end}, "\n";
        $current_range->{end} = $range->{end};
        next;
    }

    print "Adding ", $range->{start}, '-', $range->{end}, "\n";
    $current_range = $range;
    push(@merged_ranges, $current_range);
}

my $possible_fresh = 0;
foreach my $fresh_range (@merged_ranges) {
    $possible_fresh += ($fresh_range->{end} - $fresh_range->{start}) + 1;
}

my $fresh_count = 0;
while (my $line = <>) {
    chomp($line);

    print "Testing $line\n";
    foreach my $range (@merged_ranges) {
        if ($line >= $range->{start} && $line <= $range->{end}) {
            $fresh_count++;
            last;
        }
    }
}

print "Possible Fresh: $possible_fresh\n";
print "Available Fresh: $fresh_count\n";
