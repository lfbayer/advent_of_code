#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

static int BUFFER_LEN = 150;

int indexOf(char* input, char c, int offset) {
    char* ptr = strchr(input + offset, c);
    if (ptr == NULL) {
        return -1;
    }
    
    return ptr - input;
}

void run_seven(FILE* input) {
    char line[BUFFER_LEN];
    int tachyons[BUFFER_LEN];

    if (fgets(line, BUFFER_LEN, input) == NULL) {
        fprintf(stderr, "Empty input");
        return;
    }

    tachyons[indexOf(line, 'S', 0)] = 1;

    int splitCount = 0;

    while (fgets(line, BUFFER_LEN, input) != NULL) {
        for (int index = 0; (index = indexOf(line, '^', index)) >= 0; index++) {
            if (tachyons[index]) {
                splitCount++;

                tachyons[index] = 0;
                tachyons[index-1] = 1;
                tachyons[index+1] = 1;
            }
        }
    }

    printf("Split Count: %d\n", splitCount);
}
