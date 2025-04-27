#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CopyRectangleKernel.cu"
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
    float *src = NULL;
hipMalloc(&src, XSIZE*YSIZE);
int srcOffset = 1;
int srcWidth = XSIZE;
int srcRectX = 1;
int srcRectY = 1;
int rectWidth = XSIZE;
int rectHeight = YSIZE;
float *dest = NULL;
hipMalloc(&dest, XSIZE*YSIZE);
int destOffset = 1;
int destWidth = XSIZE;
int destRectX = 1;
int destRectY = 1;
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
CopyRectangleKernel<<<gridBlock, threadBlock>>>(src,srcOffset,srcWidth,srcRectX,srcRectY,rectWidth,rectHeight,dest,destOffset,destWidth,destRectX,destRectY);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CopyRectangleKernel<<<gridBlock, threadBlock>>>(src,srcOffset,srcWidth,srcRectX,srcRectY,rectWidth,rectHeight,dest,destOffset,destWidth,destRectX,destRectY);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CopyRectangleKernel<<<gridBlock, threadBlock>>>(src,srcOffset,srcWidth,srcRectX,srcRectY,rectWidth,rectHeight,dest,destOffset,destWidth,destRectX,destRectY);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}