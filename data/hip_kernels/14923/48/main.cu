#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cunn_LookupTable_accGradParametersKernel.cu"
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
    float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
float *indices = NULL;
hipMalloc(&indices, XSIZE*YSIZE);
float *gradOutput = NULL;
hipMalloc(&gradOutput, XSIZE*YSIZE);
float *gradWeight = NULL;
hipMalloc(&gradWeight, XSIZE*YSIZE);
float *count = NULL;
hipMalloc(&count, XSIZE*YSIZE);
float defaultScale = 2;
long numel = 1;
long stride = 2;
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
cunn_LookupTable_accGradParametersKernel<<<gridBlock, threadBlock>>>(input,indices,gradOutput,gradWeight,count,defaultScale,numel,stride);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cunn_LookupTable_accGradParametersKernel<<<gridBlock, threadBlock>>>(input,indices,gradOutput,gradWeight,count,defaultScale,numel,stride);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cunn_LookupTable_accGradParametersKernel<<<gridBlock, threadBlock>>>(input,indices,gradOutput,gradWeight,count,defaultScale,numel,stride);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}