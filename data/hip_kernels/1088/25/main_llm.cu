#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel2DYp_llm.cu"
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
    double *dataOutput = NULL;
hipMalloc(&dataOutput, XSIZE*YSIZE);
double *dataInput = NULL;
hipMalloc(&dataInput, XSIZE*YSIZE);
double *boundaryTop = NULL;
hipMalloc(&boundaryTop, XSIZE*YSIZE);
double *boundaryBottom = NULL;
hipMalloc(&boundaryBottom, XSIZE*YSIZE);
const double *weights = NULL;
hipMalloc(&weights, XSIZE*YSIZE);
const int numSten = 1;
const int numStenTop = 1;
const int numStenBottom = 1;
const int nxLocal = 1;
const int nyLocal = 1;
const int BLOCK_Y = 1;
const int nx = 1;
const int nyTile = 1;
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
kernel2DYp<<<gridBlock, threadBlock>>>(dataOutput,dataInput,boundaryTop,boundaryBottom,weights,numSten,numStenTop,numStenBottom,nxLocal,nyLocal,BLOCK_Y,nx,nyTile);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel2DYp<<<gridBlock, threadBlock>>>(dataOutput,dataInput,boundaryTop,boundaryBottom,weights,numSten,numStenTop,numStenBottom,nxLocal,nyLocal,BLOCK_Y,nx,nyTile);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel2DYp<<<gridBlock, threadBlock>>>(dataOutput,dataInput,boundaryTop,boundaryBottom,weights,numSten,numStenTop,numStenBottom,nxLocal,nyLocal,BLOCK_Y,nx,nyTile);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}