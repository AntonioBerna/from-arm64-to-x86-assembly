CC = gcc

CFLAGS = -Wall -Wextra -std=c99
ASMFLAGS = -S # for macbook M1: -arch i386
PREPFLAGS = -E

CTARGET = main
ASMTARGET = main.s
PREPTARGET = prep.c

SRCS = main.c
OBJS = $(SRCS:.c=.o)

%.o:%.c
	$(CC) $< -c -o $@ $(CFLAGS)

all: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(CTARGET)

.PHONY: clean asm prep

asm: 
	$(CC) $(ASMFLAGS) $(SRCS) -o $(ASMTARGET)

prep:
	$(CC) $(PREPFLAGS) $(SRCS) -o $(PREPTARGET)

clean:
	$(RM) $(CTARGET) $(ASMTARGET) $(PREPTARGET) $(OBJS)
