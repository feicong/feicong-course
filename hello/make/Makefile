CC = gcc
CFLAGS = -Wall

TARGET = hello

all: $(TARGET)

$(TARGET): hello.o
	$(CC) $(CFLAGS) -o $@ $^

hello.o: hello.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(TARGET)
