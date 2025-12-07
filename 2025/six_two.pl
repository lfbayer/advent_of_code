#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(sum product);

my @lines = <>;

my $total = 0;

my $column_start = 0;

my $operators = pop(@lines);
while ($operators =~ /(([+*]) *)( |$)/mg) {
    my $length = length($1);
    my $operator = $2;

    my @values = "" x $length;

    foreach my $line (@lines) {
        my $digits = substr($line, $column_start, $length);

        foreach my $i (0 .. $length - 1) {
            $values[$i] .= substr($digits, $i, 1);
        }
    }

    if ($operator eq '*') {
        $total += product(@values);
    }
    else {
        $total += sum(@values);
    }

    $column_start += ($length + 1);
}

print "Total: $total\n";
