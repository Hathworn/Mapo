#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cunnx_WindowGate2_updateGradInput_kernel_llm.cu"
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
    float *gradInput = NULL;
hipMalloc(&gradInput, XSIZE*YSIZE);
float *error = NULL;
hipMalloc(&error, XSIZE*YSIZE);
float *targetCentroids = NULL;
hipMalloc(&targetCentroids, XSIZE*YSIZE);
const float *centroids = NULL;
hipMalloc(&centroids, XSIZE*YSIZE);
const float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
const float *inputIndice = NULL;
hipMalloc(&inputIndice, XSIZE*YSIZE);
const float *outputIndice = NULL;
hipMalloc(&outputIndice, XSIZE*YSIZE);
const float *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
const float *gradOutput = NULL;
hipMalloc(&gradOutput, XSIZE*YSIZE);
int inputSize = XSIZE*YSIZE;
int outputSize = XSIZE*YSIZE;
int inputWindowSize = XSIZE*YSIZE;
int outputWindowSize = XSIZE*YSIZE;
int windowStride = 2;
float c = 2;
float d = 1;
float e = 1;
float lr = 1;
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
cunnx_WindowGate2_updateGradInput_kernel<<<gridBlock, threadBlock>>>(gradInput,error,targetCentroids,centroids,input,inputIndice,outputIndice,output,gradOutput,inputSize,outputSize,inputWindowSize,outputWindowSize,windowStride,c,d,e,lr);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cunnx_WindowGate2_updateGradInput_kernel<<<gridBlock, threadBlock>>>(gradInput,error,targetCentroids,centroids,input,inputIndice,outputIndice,output,gradOutput,inputSize,outputSize,inputWindowSize,outputWindowSize,windowStride,c,d,e,lr);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cunnx_WindowGate2_updateGradInput_kernel<<<gridBlock, threadBlock>>>(gradInput,error,targetCentroids,centroids,input,inputIndice,outputIndice,output,gradOutput,inputSize,outputSize,inputWindowSize,outputWindowSize,windowStride,c,d,e,lr);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}