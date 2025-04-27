#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "onBothBufferOperatorKernel_llm.cu"
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
    const int warpWidth = 1;
const int input0OffsetX = 1;
const int input0OffsetY = 1;
const int input0Width = 1;
const int input0Height = 1;
const uint32_t *input0Buffer = NULL;
hipMalloc(&input0Buffer, XSIZE*YSIZE);
const int input1OffsetX = 1;
const int input1OffsetY = 1;
const int input1Width = 1;
const int input1Height = 1;
const uint32_t *input1Buffer = NULL;
hipMalloc(&input1Buffer, XSIZE*YSIZE);
const int outputOffsetX = 1;
const int outputOffsetY = 1;
const int outputWidth = 1;
const int outputHeight = 1;
uint32_t *outputMask = NULL;
hipMalloc(&outputMask, XSIZE*YSIZE);
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
onBothBufferOperatorKernel<<<gridBlock, threadBlock>>>(warpWidth,input0OffsetX,input0OffsetY,input0Width,input0Height,input0Buffer,input1OffsetX,input1OffsetY,input1Width,input1Height,input1Buffer,outputOffsetX,outputOffsetY,outputWidth,outputHeight,outputMask);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
onBothBufferOperatorKernel<<<gridBlock, threadBlock>>>(warpWidth,input0OffsetX,input0OffsetY,input0Width,input0Height,input0Buffer,input1OffsetX,input1OffsetY,input1Width,input1Height,input1Buffer,outputOffsetX,outputOffsetY,outputWidth,outputHeight,outputMask);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
onBothBufferOperatorKernel<<<gridBlock, threadBlock>>>(warpWidth,input0OffsetX,input0OffsetY,input0Width,input0Height,input0Buffer,input1OffsetX,input1OffsetY,input1Width,input1Height,input1Buffer,outputOffsetX,outputOffsetY,outputWidth,outputHeight,outputMask);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}