#CXX=arm-linux-gnueabihf-g++
CXX=g++
RM=rm -f
CPPFLAGS=-O3 -g -Wall -std=c++11

SRCS=speedtest.cpp
OBJS=$(subst .cpp,.o,$(SRCS))

all: $(OBJS)
	$(CXX) $(LDFLAGS) -o speedtest $(OBJS)

clean:
	rm -rf $(OBJS) speedtest

