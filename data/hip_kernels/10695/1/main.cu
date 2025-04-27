#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "do_scale.cu"
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
    uint8_t *inBuffer = NULL;
hipMalloc(&inBuffer, XSIZE*YSIZE);
uint8_t *outBuffer = NULL;
hipMalloc(&outBuffer, XSIZE*YSIZE);
uint32_t inWidth = XSIZE;
uint32_t inHeight = YSIZE;
uint32_t outWidth = XSIZE;
uint32_t outHeight = YSIZE;
double ratioHeight = YSIZE;
double ratioWidth = XSIZE;
double xRatio = 1;
double yRatio = 1;
uint32_t outHeightOffset = YSIZE;
uint32_t outWidthOffset = XSIZE;
uint32_t inStep = 1;
uint32_t outStep = 1;
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
do_scale<<<gridBlock, threadBlock>>>(inBuffer,outBuffer,inWidth,inHeight,outWidth,outHeight,ratioHeight,ratioWidth,xRatio,yRatio,outHeightOffset,outWidthOffset,inStep,outStep);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
do_scale<<<gridBlock, threadBlock>>>(inBuffer,outBuffer,inWidth,inHeight,outWidth,outHeight,ratioHeight,ratioWidth,xRatio,yRatio,outHeightOffset,outWidthOffset,inStep,outStep);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
do_scale<<<gridBlock, threadBlock>>>(inBuffer,outBuffer,inWidth,inHeight,outWidth,outHeight,ratioHeight,ratioWidth,xRatio,yRatio,outHeightOffset,outWidthOffset,inStep,outStep);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}