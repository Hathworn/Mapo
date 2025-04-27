#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaSReduceIndex_kernel.cu"
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
    const unsigned int inputSize = 1;
const unsigned int inputBatchOffset = 1;
const unsigned int outputBatchOffset = 1;
const unsigned int channelsWidth = 1;
const unsigned int channelsHeight = 1;
const unsigned int nbAnchors = 1;
const float *valueThreshold = NULL;
hipMalloc(&valueThreshold, XSIZE*YSIZE);
const float *inputs = NULL;
hipMalloc(&inputs, XSIZE*YSIZE);
int *outputMap = NULL;
hipMalloc(&outputMap, XSIZE*YSIZE);
float *scores = NULL;
hipMalloc(&scores, XSIZE*YSIZE);
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
cudaSReduceIndex_kernel<<<gridBlock, threadBlock>>>(inputSize,inputBatchOffset,outputBatchOffset,channelsWidth,channelsHeight,nbAnchors,valueThreshold,inputs,outputMap,scores);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaSReduceIndex_kernel<<<gridBlock, threadBlock>>>(inputSize,inputBatchOffset,outputBatchOffset,channelsWidth,channelsHeight,nbAnchors,valueThreshold,inputs,outputMap,scores);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaSReduceIndex_kernel<<<gridBlock, threadBlock>>>(inputSize,inputBatchOffset,outputBatchOffset,channelsWidth,channelsHeight,nbAnchors,valueThreshold,inputs,outputMap,scores);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}