#!/usr/bin/perl

use strict;
use warnings;

my $running_totals = {};

while (my $line = <>) {
    print $line;
    if ($line =~ /[+*]/) {
        my $total = 0;
        my $column = 0;
        while ($line =~ /([*+])/g) {
            my $operation = $1;
            if ($operation eq '*') {
                $total += $running_totals->{$column}->{product};
            }
            elsif ($operation eq '+') {
                $total += $running_totals->{$column}->{sum};
            }

            $column++;
        }

        print "Total: $total\n";

        last;
    }

    my $column = 0;
    while ($line =~ /(\d+)/g) {
        my $value = $1;

        if (!defined($running_totals->{$column})) {
            $running_totals->{$column} = {
                sum => $value,
                product => $value
            };
        }
        else {
            $running_totals->{$column}->{sum} += $value;
            $running_totals->{$column}->{product} *= $value;
        }

        $column++;
    }
}