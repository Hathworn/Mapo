#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cu_minMaxLoc_llm.cu"
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
    const float *src = NULL;
hipMalloc(&src, XSIZE*YSIZE);
float *minValue = NULL;
hipMalloc(&minValue, XSIZE*YSIZE);
float *maxValue = NULL;
hipMalloc(&maxValue, XSIZE*YSIZE);
int *minLoc = NULL;
hipMalloc(&minLoc, XSIZE*YSIZE);
int *maxLoc = NULL;
hipMalloc(&maxLoc, XSIZE*YSIZE);
float *minValCache = NULL;
hipMalloc(&minValCache, XSIZE*YSIZE);
float *maxValCache = NULL;
hipMalloc(&maxValCache, XSIZE*YSIZE);
int *minLocCache = NULL;
hipMalloc(&minLocCache, XSIZE*YSIZE);
int *maxLocCache = NULL;
hipMalloc(&maxLocCache, XSIZE*YSIZE);
const int n = 1;
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
cu_minMaxLoc<<<gridBlock, threadBlock>>>(src,minValue,maxValue,minLoc,maxLoc,minValCache,maxValCache,minLocCache,maxLocCache,n);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cu_minMaxLoc<<<gridBlock, threadBlock>>>(src,minValue,maxValue,minLoc,maxLoc,minValCache,maxValCache,minLocCache,maxLocCache,n);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cu_minMaxLoc<<<gridBlock, threadBlock>>>(src,minValue,maxValue,minLoc,maxLoc,minValCache,maxValCache,minLocCache,maxLocCache,n);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}