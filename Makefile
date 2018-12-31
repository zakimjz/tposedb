#CC  = CC
CC = g++
CFLAGS = -O3 -Wno-deprecated
HEADERS = calcdb.h Array.h
OBJS	= calcdb.o Array.o
LIBS = -lm -lc
TARGET  = newexttpose exttpose makebin getconf b2a

default:	$(TARGET) 

clean:
	rm -rf *~ *.o $(TARGET)

tpose: tpose.cc $(OBJS)
	$(CC) $(CFLAGS) -o tpose tpose.cc $(OBJS) $(LIBS)

exttpose: exttpose.cc $(OBJS) $(HEADERS)
	$(CC) $(CFLAGS) -o exttpose exttpose.cc $(OBJS) $(LIBS)

newexttpose: newexttpose.cc $(OBJS) $(HEADERS)
	$(CC) $(CFLAGS) -o newexttpose newexttpose.cc $(OBJS) $(LIBS)

Database.o: Database.cc Database.h
	$(CC) $(CFLAGS) -c -o Database.o Database.cc

Array.o: Array.cc Array.h
	$(CC) $(CFLAGS) -c -o Array.o Array.cc

getconf: calcdb.o getconf.cc calcdb.h 
	$(CC) $(CFLAGS) -o getconf calcdb.o getconf.cc $(LIBS)

calcdb.o: calcdb.cc calcdb.h
	$(CC) $(CFLAGS) -c -o calcdb.o calcdb.cc

makebin: makebin.cc
	$(CC) $(CFLAGS) -o makebin makebin.cc

b2a: b2a.cc
	$(CC) $(CFLAGS) -o b2a b2a.cc
