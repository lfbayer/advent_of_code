
#include <stdio.h>
#include <sysexits.h>
#include <stdlib.h>

#include "aoc.h"


int main(int argc, char** argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage:\n");
        fprintf(stderr, "  aoc <puzzle> [input-file]\n");
        return EX_USAGE;
    }

    char* puzzleName = argv[1];
    int puzzleNumber = atoi(puzzleName);
    if (puzzleNumber == 0 || puzzleNumber > PUZZLE_COUNT) {
        fprintf(stderr, "Invalid puzzle number: %s\n", puzzleName);
        return EX_USAGE;
    }

    puzzleNumber--;

    FILE* inputFd;
    if (argc < 3) {
        inputFd = stdin;
        fprintf(stderr, "Reading input from STDIN...\n");
    }
    else {
        inputFd = fopen(argv[2], "r");
    }

    (*PUZZLES[puzzleNumber])(inputFd);

    if (inputFd != stdin) {
        fclose(inputFd);
    }

    return EX_OK;
}
