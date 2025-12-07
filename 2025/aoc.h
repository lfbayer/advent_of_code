#pragma once

#include <stdio.h>

void run_one(FILE* fd);
void run_two(FILE* fd);
void run_three(FILE* fd);
void run_four(FILE* fd);
void run_four_two(FILE* fd);
// void run_five(FILE* fd);
// void run_six(FILE* fd);
// void run_seven(FILE* fd);

const int PUZZLE_COUNT = 4;
static void (*PUZZLES[PUZZLE_COUNT])(FILE*) = {
    &run_one,
    &run_two,
    &run_three,
    // &run_four,
    &run_four_two,
    // &run_five,
    // &run_six,
    // &run_seven,
};
