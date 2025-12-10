CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -g
TARGET = shell
SRCS = src/main.c src/parser.c src/executor.c src/builtins.c src/redirections.c src/pipes.c src/signals.c src/history.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
