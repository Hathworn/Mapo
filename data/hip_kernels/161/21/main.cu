#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "getUnrestricted.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int main(int argc, char **argv) {
hipSetDevice(0);

    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    int countx = 1;
int county = 1;
int rows = XSIZE;
int cols = YSIZE;
float *mX = NULL;
hipMalloc(&mX, XSIZE*YSIZE);
int mXdim = 1;
float *vY = NULL;
hipMalloc(&vY, XSIZE*YSIZE);
int vYdim = 1;
float *mQ = NULL;
hipMalloc(&mQ, XSIZE*YSIZE);
int mQdim = 1;
float *mR = NULL;
hipMalloc(&mR, XSIZE*YSIZE);
int mRdim = 1;
float *vectB = NULL;
hipMalloc(&vectB, XSIZE*YSIZE);
int vectBdim = 1;
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
getUnrestricted<<<gridBlock, threadBlock>>>(countx,county,rows,cols,mX,mXdim,vY,vYdim,mQ,mQdim,mR,mRdim,vectB,vectBdim);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
getUnrestricted<<<gridBlock, threadBlock>>>(countx,county,rows,cols,mX,mXdim,vY,vYdim,mQ,mQdim,mR,mRdim,vectB,vectBdim);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
getUnrestricted<<<gridBlock, threadBlock>>>(countx,county,rows,cols,mX,mXdim,vY,vYdim,mQ,mQdim,mR,mRdim,vectB,vectBdim);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}