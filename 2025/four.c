#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int ROW_COUNT = 140;
static int ROW_LENGTH = 140;

void run_four(FILE* input) {
    char rows[ROW_COUNT + 2][ROW_LENGTH + 1];

    int rowNum = 1;
    while (fgets(rows[rowNum]+1, ROW_LENGTH+1, input) != NULL) {
        rows[rowNum][0] = '.';
        rows[rowNum][ROW_LENGTH] = '.';

        rowNum++;
    }

    printf("Size: %d x %d\n", ROW_LENGTH, ROW_COUNT);

    for (int i = 0; i < ROW_LENGTH + 1; i++) {
        rows[0][i] = '.';
        rows[ROW_COUNT+1][i] = '.';
    }

    int reachableCount = 0;
    for (int y = 1; y < ROW_COUNT; y++) {
        for (int x = 1; x < ROW_LENGTH; x++) {
            char value = rows[y][x];
            if (value != '@') {
                putchar(value);
                continue;
            }

            int count = 0;

            // Previous Row
            if (rows[y - 1][x - 1] == '@') {
                count++;
            }

            if (rows[y][x - 1] == '@') {
                count++;
            }

            if (rows[y + 1][x - 1] == '@') {
                count++;
            }

            // Same Row
            if (rows[y - 1][x] == '@') {
                count++;
            }

            if (rows[y + 1][x] == '@') {
                count++;
            }

            // Next Row
            if (rows[y - 1][x + 1] == '@') {
                count++;
            }

            if (rows[y][x + 1] == '@') {
                count++;
            }

            if (rows[y + 1][x + 1] == '@') {
                count++;
            }

            if (count < 4) {
                putchar('x');
                reachableCount++;
            }
            else {
                putchar('@');
            }

        }

        putchar('\n');
    }

    printf("Reachable: %d\n", reachableCount);
}
