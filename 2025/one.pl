#!/usr/bin/perl

my $position = 50;

my $zero_count = 0;
while (my $line = <>) {
    my ($direction, $offset) = $line =~ /([RL])(\d+)/;

    my $delta = $direction eq 'L' ? -1 : 1;
    while ($offset > 0) {
        $offset--;
        $position += $delta;

        if ($position == 0) {
            $zero_count++;
        }
        elsif ($position == 100) {
            $position = 0;
            $zero_count++;
        }
        elsif ($position == -1) {
            $position = 99;
        }
    }

    print "Position is now $position\n";
}

print "Zero Count: $zero_count\n";
