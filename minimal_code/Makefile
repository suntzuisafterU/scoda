CXX:=g++
CC:=gcc

DEBUG?=0 # Conditionally set debug flag.  If not provided from command line?
ifeq ($(DEBUG), 1)
	CXXFLAGS:=-Wextra -Wall -g
else
	CXXFLAGS:=-Wextra -Wall
endif

LDFLAGS:=-lstdc++

.PHONY: all clean

all: scoda.c
	gcc -o scoda scoda.c

clean:
	rm -rf scoda