#include <errno.h>
#include <iostream>
#include <stdio.h>
#include <fstream>
#include <backward/strstream>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <math.h>
using namespace std;
#define ITSZ sizeof(int)
const int lineSize=1024*1024;
const int wdSize=256;
ifstream fin;
ofstream fout;

void convbin(char *inBuf, int inSize)
{
   char inStr[wdSize];
   istrstream ist(inBuf, inSize);
   int it;

   ist >> inStr;
   int cid = atoi(inStr);
   ist >> inStr;
   int tid = atoi(inStr);
   ist >> inStr;
   int nitems = atoi(inStr);

   fout.write((char*)&cid, ITSZ);
   fout.write((char*)&tid, ITSZ);
   fout.write((char*)&nitems, ITSZ);

   for (int i=0; i < nitems; ++i){
      ist >> inStr;
      it = atoi(inStr);
      //cout << it  << " ";
      fout.write((char*)&it, ITSZ);
   }
   //cout << endl;
}

int main(int argc, char **argv)
{
   char inBuf[lineSize];
   int inSize;
   fin.open(argv[1]);
   if (!fin){
      perror("cannot open in file");
      exit(errno);
   }
   fout.open(argv[2]);
   if (!fout){
      perror("cannot open out file");
      exit(errno);
   }

   while(fin.getline(inBuf, lineSize)){
      inSize = fin.gcount();
      //cout << "IN SIZE " << inSize << endl;
      convbin(inBuf, inSize);
   }
}
