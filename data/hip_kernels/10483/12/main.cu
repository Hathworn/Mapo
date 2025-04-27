#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "mteKernel.cu"
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
    int noPaths = 1;
int nYears = 1;
int noPatches = 1;
float timeStep = 1;
float *rgr = NULL;
hipMalloc(&rgr, XSIZE*YSIZE);
float *brownians = NULL;
hipMalloc(&brownians, XSIZE*YSIZE);
float *jumpSizes = NULL;
hipMalloc(&jumpSizes, XSIZE*YSIZE);
float *jumps = NULL;
hipMalloc(&jumps, XSIZE*YSIZE);
float *speciesParams = NULL;
hipMalloc(&speciesParams, XSIZE*YSIZE);
float *initPops = NULL;
hipMalloc(&initPops, XSIZE*YSIZE);
float *caps = NULL;
hipMalloc(&caps, XSIZE*YSIZE);
float *mmm = NULL;
hipMalloc(&mmm, XSIZE*YSIZE);
int *rowIdx = NULL;
hipMalloc(&rowIdx, XSIZE*YSIZE);
int *elemsPerCol = NULL;
hipMalloc(&elemsPerCol, XSIZE*YSIZE);
float *pathPops = NULL;
hipMalloc(&pathPops, XSIZE*YSIZE);
float *eps = NULL;
hipMalloc(&eps, XSIZE*YSIZE);
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
mteKernel<<<gridBlock, threadBlock>>>(noPaths,nYears,noPatches,timeStep,rgr,brownians,jumpSizes,jumps,speciesParams,initPops,caps,mmm,rowIdx,elemsPerCol,pathPops,eps);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
mteKernel<<<gridBlock, threadBlock>>>(noPaths,nYears,noPatches,timeStep,rgr,brownians,jumpSizes,jumps,speciesParams,initPops,caps,mmm,rowIdx,elemsPerCol,pathPops,eps);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
mteKernel<<<gridBlock, threadBlock>>>(noPaths,nYears,noPatches,timeStep,rgr,brownians,jumpSizes,jumps,speciesParams,initPops,caps,mmm,rowIdx,elemsPerCol,pathPops,eps);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}