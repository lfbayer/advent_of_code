#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define BUFFER_LEN 500

int isDigit(char c) {
    return c >= '0' && c <= '9';
}

bool isValidNumber(long id) {
    char idString[20];

    int len = sprintf(idString, "%ld", id);

    // must be valid for all segment lengths
    for (int segmentCount = len; segmentCount > 1; segmentCount--) {
        if (len % segmentCount != 0) {
            continue;
        }

        bool isValid = false;

        // for each segment
        int segmentLength = len / segmentCount;
        
        for (int segmentOffset = segmentLength; segmentOffset < len; segmentOffset += segmentLength) {
            if (strncmp(idString, idString + segmentOffset, segmentLength) != 0) {
                // valid for this segment length.
                isValid = true;
                break;
            }
        }

        if (!isValid) {
            return false;
        }
    }

    return true;
}

void run_two(FILE* input) {
    char line[BUFFER_LEN];

    long invalidSum = 0;

    while (fgets(line, BUFFER_LEN, input) != NULL) {
        int charIndex = 0;

        int endOfLine = 0;
        while (!endOfLine && isDigit(line[charIndex])) {
            long start = 0;
            while (1) {
                if (line[charIndex] == '-') {
                    charIndex++;
                    break;
                }

                start *= 10;
                start += line[charIndex] - '0';
                charIndex++;
            }

            long end = 0;
            while (1) {
                if (line[charIndex] == ',') {
                    charIndex++;
                    break;
                }

                if (!isDigit(line[charIndex])) {
                    endOfLine = 1;
                    break;
                }

                end *= 10;
                end += line[charIndex] - '0';
                charIndex++;
            }

            printf("Handling range '%ld-%ld'\n", start, end);
            if (end < 0 || start < 0) {
                fprintf(stderr, "Invalid range");
                return;
            }

            for (long id = start; id <= end; id++) {
                if (!isValidNumber(id)) {
                    printf("Invalid: %ld\n", id);
                    invalidSum += id;
                }
            }
        }
    }

    printf("Sum: %ld\n", invalidSum);
}
