#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "depthwise_filter_backward_llm.cu"
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
    int B = 2;
int N = XSIZE*YSIZE;
int M = 2;
int F = 1;
int C = 2;
int r = 1;
int K = 1;
const int *nnIndex = NULL;
hipMalloc(&nnIndex, XSIZE*YSIZE);
const int *nnCount = NULL;
hipMalloc(&nnCount, XSIZE*YSIZE);
const int *binIndex = NULL;
hipMalloc(&binIndex, XSIZE*YSIZE);
const float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
const float *gradOutput = NULL;
hipMalloc(&gradOutput, XSIZE*YSIZE);
float *gradFilter = NULL;
hipMalloc(&gradFilter, XSIZE*YSIZE);
int sharedMemSize = XSIZE*YSIZE;
int startIdx = 1;
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
depthwise_filter_backward<<<gridBlock, threadBlock>>>(B,N,M,F,C,r,K,nnIndex,nnCount,binIndex,input,gradOutput,gradFilter,sharedMemSize,startIdx);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
depthwise_filter_backward<<<gridBlock, threadBlock>>>(B,N,M,F,C,r,K,nnIndex,nnCount,binIndex,input,gradOutput,gradFilter,sharedMemSize,startIdx);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
depthwise_filter_backward<<<gridBlock, threadBlock>>>(B,N,M,F,C,r,K,nnIndex,nnCount,binIndex,input,gradOutput,gradFilter,sharedMemSize,startIdx);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}