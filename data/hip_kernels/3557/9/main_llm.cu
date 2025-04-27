#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaSBilinearTF_kernel_llm.cu"
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
    unsigned int outputWidth = 1;
unsigned int outputHeight = 1;
unsigned int nbChannels = 1;
unsigned int batchSize = 1;
unsigned int inputWidth = 1;
unsigned int inputHeight = 1;
const unsigned int *yLowIdx = NULL;
hipMalloc(&yLowIdx, XSIZE*YSIZE);
const unsigned int *yHighIdx = NULL;
hipMalloc(&yHighIdx, XSIZE*YSIZE);
const float *yInter = NULL;
hipMalloc(&yInter, XSIZE*YSIZE);
const unsigned int *xLowIdx = NULL;
hipMalloc(&xLowIdx, XSIZE*YSIZE);
const unsigned int *xHighIdx = NULL;
hipMalloc(&xHighIdx, XSIZE*YSIZE);
const float *xInter = NULL;
hipMalloc(&xInter, XSIZE*YSIZE);
const float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
float *outputs = NULL;
hipMalloc(&outputs, XSIZE*YSIZE);
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
cudaSBilinearTF_kernel<<<gridBlock, threadBlock>>>(outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,yLowIdx,yHighIdx,yInter,xLowIdx,xHighIdx,xInter,input,outputs);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaSBilinearTF_kernel<<<gridBlock, threadBlock>>>(outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,yLowIdx,yHighIdx,yInter,xLowIdx,xHighIdx,xInter,input,outputs);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaSBilinearTF_kernel<<<gridBlock, threadBlock>>>(outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,yLowIdx,yHighIdx,yInter,xLowIdx,xHighIdx,xInter,input,outputs);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}