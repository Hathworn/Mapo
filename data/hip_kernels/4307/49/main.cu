#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "updateGradInputPlanewiseKernel.cu"
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
    float *gradOutputIntData = NULL;
hipMalloc(&gradOutputIntData, XSIZE*YSIZE);
float *gradInputData = NULL;
hipMalloc(&gradInputData, XSIZE*YSIZE);
int h = YSIZE;
int w = XSIZE;
int nWindows = 1;
float *xMin = NULL;
hipMalloc(&xMin, XSIZE*YSIZE);
float *xMax = NULL;
hipMalloc(&xMax, XSIZE*YSIZE);
float *yMin = NULL;
hipMalloc(&yMin, XSIZE*YSIZE);
float *yMax = NULL;
hipMalloc(&yMax, XSIZE*YSIZE);
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
updateGradInputPlanewiseKernel<<<gridBlock, threadBlock>>>(gradOutputIntData,gradInputData,h,w,nWindows,xMin,xMax,yMin,yMax);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
updateGradInputPlanewiseKernel<<<gridBlock, threadBlock>>>(gradOutputIntData,gradInputData,h,w,nWindows,xMin,xMax,yMin,yMax);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
updateGradInputPlanewiseKernel<<<gridBlock, threadBlock>>>(gradOutputIntData,gradInputData,h,w,nWindows,xMin,xMax,yMin,yMax);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}