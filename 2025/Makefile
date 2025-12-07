
PROGNAME=aoc

CC=gcc

CFLAGS=-g

SRC_FILES=main.c one.c two.c three.c four.c four_two.c
OBJ=$(SRC_FILES:%.c=%.o)

$(PROGNAME): $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LDLIBS)

%.o: %.c aoc.h
	$(CC) $(INC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f $(PROGNAME) $(OBJ) $(ZIPFILE)