#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernelReadMotionEnergyAsync.cu"
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
    float *gpuConvBufferl1 = NULL;
hipMalloc(&gpuConvBufferl1, XSIZE*YSIZE);
float *gpuConvBufferl2 = NULL;
hipMalloc(&gpuConvBufferl2, XSIZE*YSIZE);
int ringBufferIdx = 1;
int bsx = 1;
int bsy = 1;
int n = XSIZE*YSIZE;
float *gpuEnergyBuffer = NULL;
hipMalloc(&gpuEnergyBuffer, XSIZE*YSIZE);
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
kernelReadMotionEnergyAsync<<<gridBlock, threadBlock>>>(gpuConvBufferl1,gpuConvBufferl2,ringBufferIdx,bsx,bsy,n,gpuEnergyBuffer);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernelReadMotionEnergyAsync<<<gridBlock, threadBlock>>>(gpuConvBufferl1,gpuConvBufferl2,ringBufferIdx,bsx,bsy,n,gpuEnergyBuffer);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernelReadMotionEnergyAsync<<<gridBlock, threadBlock>>>(gpuConvBufferl1,gpuConvBufferl2,ringBufferIdx,bsx,bsy,n,gpuEnergyBuffer);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}