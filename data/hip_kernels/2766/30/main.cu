#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaSBilinearTF_BackWard_kernel.cu"
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
const float scaleX = 1;
const float scaleY = 1;
const float *diffInput = NULL;
hipMalloc(&diffInput, XSIZE*YSIZE);
float *diffOutputs = NULL;
hipMalloc(&diffOutputs, XSIZE*YSIZE);
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
cudaSBilinearTF_BackWard_kernel<<<gridBlock, threadBlock>>>(outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,scaleX,scaleY,diffInput,diffOutputs);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaSBilinearTF_BackWard_kernel<<<gridBlock, threadBlock>>>(outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,scaleX,scaleY,diffInput,diffOutputs);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaSBilinearTF_BackWard_kernel<<<gridBlock, threadBlock>>>(outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,scaleX,scaleY,diffInput,diffOutputs);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}