#!/usr/bin/perl

use strict;
use warnings;

my $rows;
while (my $line = <STDIN>) {
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
foreach my $x (1 .. $width) {
    foreach my $y (1 .. $height) {
        my $value = $$rows[$x][$y];
        if ($value ne '@') {
            print $value;
            next;
        }

        my $count = 0;

        # Previous Row
        if ($$rows[$x - 1][$y - 1] eq '@') {
            $count++;
        }

        if ($$rows[$x][$y - 1] eq '@') {
            $count++;
        }

        if ($$rows[$x + 1][$y - 1] eq '@') {
            $count++;
        }

        # Same Row
        if ($$rows[$x - 1][$y] eq '@') {
            $count++;
        }

        if ($$rows[$x + 1][$y] eq '@') {
            $count++;
        }

        # Next Row
        if ($$rows[$x - 1][$y + 1] eq '@') {
            $count++;
        }

        if ($$rows[$x][$y + 1] eq '@') {
            $count++;
        }

        if ($$rows[$x + 1][$y + 1] eq '@') {
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