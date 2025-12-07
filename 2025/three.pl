#!/usr/bin/perl

use strict;
use warnings;

my $battery_count = 12;

my $total_max_power = 0;

while (my $line = <>) {
    chomp($line);

    my @digits = split(//, $line);
    my $len = scalar(@digits);

    my @max_indexes;

    my $max_index = 0;
    foreach my $pass (0 .. ($battery_count - 1)) {
        foreach my $i (($max_index+1) .. ($len - ($battery_count - $pass))) {
            if ($digits[$i] > $digits[$max_index]) {
                $max_index = $i;
            }
        }

        $max_indexes[$pass] = $max_index;
        $max_index++;
    }

    
    my $max_power = join("", map {$digits[$_]} @max_indexes);
    print "Max Power: $max_power\n";
    $total_max_power += $max_power;
}

print "Total Max Power: $total_max_power\n";
