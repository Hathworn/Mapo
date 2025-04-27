#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cunnx_BlockSparse_accGradParameters_kernel.cu"
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
    float *gradWeight = NULL;
hipMalloc(&gradWeight, XSIZE*YSIZE);
float *gradBias = NULL;
hipMalloc(&gradBias, XSIZE*YSIZE);
float *gradOutput = NULL;
hipMalloc(&gradOutput, XSIZE*YSIZE);
float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
float *inputIndice = NULL;
hipMalloc(&inputIndice, XSIZE*YSIZE);
float *outputIndice = NULL;
hipMalloc(&outputIndice, XSIZE*YSIZE);
int inputSize = XSIZE*YSIZE;
int outputSize = XSIZE*YSIZE;
int nInputBlock = 1;
int nOutputBlock = 1;
int inputWindowSize = XSIZE*YSIZE;
int outputWindowSize = XSIZE*YSIZE;
float scale = 2;
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
cunnx_BlockSparse_accGradParameters_kernel<<<gridBlock, threadBlock>>>(gradWeight,gradBias,gradOutput,input,inputIndice,outputIndice,inputSize,outputSize,nInputBlock,nOutputBlock,inputWindowSize,outputWindowSize,scale);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cunnx_BlockSparse_accGradParameters_kernel<<<gridBlock, threadBlock>>>(gradWeight,gradBias,gradOutput,input,inputIndice,outputIndice,inputSize,outputSize,nInputBlock,nOutputBlock,inputWindowSize,outputWindowSize,scale);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cunnx_BlockSparse_accGradParameters_kernel<<<gridBlock, threadBlock>>>(gradWeight,gradBias,gradOutput,input,inputIndice,outputIndice,inputSize,outputSize,nInputBlock,nOutputBlock,inputWindowSize,outputWindowSize,scale);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}