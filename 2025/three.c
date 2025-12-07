#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BATTERY_COUNT 12

static int BUFFER_LEN = 500;

void run_three(FILE* input) {
    char line[BUFFER_LEN];

    int maxIndexes[BATTERY_COUNT];
    char maxPowerBuf[BATTERY_COUNT + 1]; // The +1 is a '\0' automatically

    long totalMaxPower = 0;

    while (fgets(line, BUFFER_LEN, input) != NULL) {
        size_t len = strlen(line);

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
        
        for (int i = 0; i < BATTERY_COUNT; i++) {
            maxPowerBuf[i] = line[maxIndexes[i]];
        }

        printf("Max Power: %s\n", maxPowerBuf);
        totalMaxPower += atol(maxPowerBuf);
    }

    printf("Total Max Power: %ld\n", totalMaxPower);
}
