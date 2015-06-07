CXX=arm-linux-gnueabihf-g++
RM=rm -f
CPPFLAGS=-g -Wall

SRCS=main.cpp fpgacontroller.cpp
OBJS=$(subst .cpp,.o,$(SRCS))


all: $(OBJS)
	$(CXX) $(LDFLAGS) -o fpgacontroller $(OBJS)

clean:
	rm -rf $(OBJS) fpgacontroller

