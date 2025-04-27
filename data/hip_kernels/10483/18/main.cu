#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "allocateXYRegressionData.cu"
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
int noControls = 1;
int noDims = 1;
int nYears = 1;
float *speciesParams = NULL;
hipMalloc(&speciesParams, XSIZE*YSIZE);
int year = 1;
int *controls = NULL;
hipMalloc(&controls, XSIZE*YSIZE);
float *xin = NULL;
hipMalloc(&xin, XSIZE*YSIZE);
float *condExp = NULL;
hipMalloc(&condExp, XSIZE*YSIZE);
int *dataPoints = NULL;
hipMalloc(&dataPoints, XSIZE*YSIZE);
float *xvals = NULL;
hipMalloc(&xvals, XSIZE*YSIZE);
float *yvals = NULL;
hipMalloc(&yvals, XSIZE*YSIZE);
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
allocateXYRegressionData<<<gridBlock, threadBlock>>>(noPaths,noControls,noDims,nYears,speciesParams,year,controls,xin,condExp,dataPoints,xvals,yvals);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
allocateXYRegressionData<<<gridBlock, threadBlock>>>(noPaths,noControls,noDims,nYears,speciesParams,year,controls,xin,condExp,dataPoints,xvals,yvals);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
allocateXYRegressionData<<<gridBlock, threadBlock>>>(noPaths,noControls,noDims,nYears,speciesParams,year,controls,xin,condExp,dataPoints,xvals,yvals);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}