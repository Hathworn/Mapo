#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Correlation_forward.cu"
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
    float *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
int nOutputChannels = 1;
int outputHeight = YSIZE;
int outputWidth = XSIZE;
float *rInput1 = NULL;
hipMalloc(&rInput1, XSIZE*YSIZE);
int nInputChannels = 1;
int inputHeight = YSIZE;
int inputWidth = XSIZE;
float *rInput2 = NULL;
hipMalloc(&rInput2, XSIZE*YSIZE);
int pad_size = XSIZE*YSIZE;
int kernel_size = XSIZE*YSIZE;
int max_displacement = 1;
int stride1 = 2;
int stride2 = 2;
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
Correlation_forward<<<gridBlock, threadBlock>>>(output,nOutputChannels,outputHeight,outputWidth,rInput1,nInputChannels,inputHeight,inputWidth,rInput2,pad_size,kernel_size,max_displacement,stride1,stride2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Correlation_forward<<<gridBlock, threadBlock>>>(output,nOutputChannels,outputHeight,outputWidth,rInput1,nInputChannels,inputHeight,inputWidth,rInput2,pad_size,kernel_size,max_displacement,stride1,stride2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Correlation_forward<<<gridBlock, threadBlock>>>(output,nOutputChannels,outputHeight,outputWidth,rInput1,nInputChannels,inputHeight,inputWidth,rInput2,pad_size,kernel_size,max_displacement,stride1,stride2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}