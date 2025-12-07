#!/usr/bin/perl

use strict;
use warnings;

my $rows;
while (my $line = <>) {
    chomp($line);
    my @row = split(//, $line);
    unshift(@row, '.');
    push(@row, '.');

    push(@$rows, \@row);
}

my $width = scalar(@{@$rows[0]}) - 2;
my $height = scalar(@$rows);
print "Size: $width x $height\n";

my @empty_row = ('.') x ($width + 2);
unshift(@$rows, \@empty_row);
push(@$rows, \@empty_row);

my $reachable_count = 0;
foreach my $y (1 .. $height) {
    foreach my $x (1 .. $width) {
        my $value = $$rows[$y][$x];
        if ($value ne '@') {
            print $value;
            next;
        }

        my $count = 0;

        # Previous Row
        if ($$rows[$y - 1][$x - 1] eq '@') {
            $count++;
        }

        if ($$rows[$y][$x - 1] eq '@') {
            $count++;
        }

        if ($$rows[$y + 1][$x - 1] eq '@') {
            $count++;
        }

        # Same Row
        if ($$rows[$y - 1][$x] eq '@') {
            $count++;
        }

        if ($$rows[$y + 1][$x] eq '@') {
            $count++;
        }

        # Next Row
        if ($$rows[$y - 1][$x + 1] eq '@') {
            $count++;
        }

        if ($$rows[$y][$x + 1] eq '@') {
            $count++;
        }

        if ($$rows[$y + 1][$x + 1] eq '@') {
            $count++;
        }

        if ($count < 4) {
            print 'x';
            $reachable_count++;
        }
        else {
            print '@';
        }        
    }

    print "\n";
}

print "Reachable: $reachable_count\n";