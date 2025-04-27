#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "convolution_llm.cu"
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
int inputRows = 1;
int inputCols = 1;
int inputLd = 1;
float *kernel = NULL;
hipMalloc(&kernel, XSIZE*YSIZE);
int kernelRows = 1;
int kernelCols = 1;
int kernelLd = 1;
int rowStep = 1;
int colStep = 1;
float *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
int outputLd = 1;
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
convolution<<<gridBlock, threadBlock>>>(input,inputRows,inputCols,inputLd,kernel,kernelRows,kernelCols,kernelLd,rowStep,colStep,output,outputLd);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
convolution<<<gridBlock, threadBlock>>>(input,inputRows,inputCols,inputLd,kernel,kernelRows,kernelCols,kernelLd,rowStep,colStep,output,outputLd);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
convolution<<<gridBlock, threadBlock>>>(input,inputRows,inputCols,inputLd,kernel,kernelRows,kernelCols,kernelLd,rowStep,colStep,output,outputLd);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}