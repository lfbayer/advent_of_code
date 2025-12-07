
#include <stdio.h>
#include <stdlib.h>

#define BUFFER_LEN 10

void run_one(FILE* input) {
    char lineBuffer[BUFFER_LEN];

    int position = 50;
    int zeroCount = 0;

    while (fgets(lineBuffer, BUFFER_LEN, input) != NULL) {
        char direction = lineBuffer[0];
        int offset = atoi(lineBuffer+1);

        int delta = direction == 'L' ? -1 : 1;
        while (offset > 0) {
            offset--;
            position += delta;

            if (position == 0) {
                zeroCount++;
            }
            else if (position == 100) {
                position = 0;
                zeroCount++;
            }
            else if (position == -1) {
                position = 99;
            }
        }

        printf("Position is now %d\n", position);
    }

    printf("Zero Count: %d\n", zeroCount);
}

