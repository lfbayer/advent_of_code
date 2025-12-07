#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BATTERY_COUNT 12

static int BUFFER_LEN = 500;

int ctoi(char c) {
    return c - '0';
}

void run_three(FILE* input) {
    char line[BUFFER_LEN];
    long totalMaxPower = 0;

    while (fgets(line, BUFFER_LEN, input) != NULL) {
        size_t len = strlen(line);

        int maxIndexes[BATTERY_COUNT] = {0};

        int maxIndex = 0;
        for (int pass = 0; pass < BATTERY_COUNT; pass++) {
            for (int i = maxIndex+1; i < len - (BATTERY_COUNT - pass); i++) {
                if (line[i] > line[maxIndex]) {
                    maxIndex = i;
                }
            }

            maxIndexes[pass] = maxIndex;
            maxIndex++;
        }

        char maxPower[BUFFER_LEN];        
        int i = 0;
        while (i < BATTERY_COUNT) {
            maxPower[i] = line[maxIndexes[i]];
            i++;
        }
        maxPower[i] = '\0';

        printf("Max Power: %s\n", maxPower);
        totalMaxPower += atol(maxPower);
    }

    printf("Total Max Power: %ld\n", totalMaxPower);
}
