CXX=arm-linux-gnueabihf-g++
RM=rm -f
CPPFLAGS=-O3 -g -Wall -std=c++11

SRCS=main.cpp fpgacontroller.cpp channel.cpp
OBJS=$(subst .cpp,.o,$(SRCS))


all: $(OBJS)
	$(CXX) $(LDFLAGS) -o fpgacontroller $(OBJS)

clean:
	rm -rf $(OBJS) fpgacontroller

