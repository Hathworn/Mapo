#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernelProcessEventsBatchAsync_llm.cu"
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
    uint8_t *gpuEventsX = NULL;
hipMalloc(&gpuEventsX, XSIZE*YSIZE);
uint8_t *gpuEventsY = NULL;
hipMalloc(&gpuEventsY, XSIZE*YSIZE);
int gpuEventListSize = XSIZE*YSIZE;
float *gpuFilter = NULL;
hipMalloc(&gpuFilter, XSIZE*YSIZE);
int fsx = 1;
int fsy = 1;
int fsz = 1;
float *gpuBuffer = NULL;
hipMalloc(&gpuBuffer, XSIZE*YSIZE);
int ringBufferIdx = 1;
int bsx = 1;
int bsy = 1;
int bsz = 1;
int fs_xy = 1;
int fn = 1;
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
kernelProcessEventsBatchAsync<<<gridBlock, threadBlock>>>(gpuEventsX,gpuEventsY,gpuEventListSize,gpuFilter,fsx,fsy,fsz,gpuBuffer,ringBufferIdx,bsx,bsy,bsz,fs_xy,fn);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernelProcessEventsBatchAsync<<<gridBlock, threadBlock>>>(gpuEventsX,gpuEventsY,gpuEventListSize,gpuFilter,fsx,fsy,fsz,gpuBuffer,ringBufferIdx,bsx,bsy,bsz,fs_xy,fn);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernelProcessEventsBatchAsync<<<gridBlock, threadBlock>>>(gpuEventsX,gpuEventsY,gpuEventListSize,gpuFilter,fsx,fsy,fsz,gpuBuffer,ringBufferIdx,bsx,bsy,bsz,fs_xy,fn);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}