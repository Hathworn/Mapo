#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaSPadding_kernel.cu"
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
    unsigned int nbOutputs = 1;
unsigned int outputWidth = 1;
unsigned int outputHeight = 1;
unsigned int nbChannels = 1;
unsigned int batchSize = 1;
unsigned int inputWidth = 1;
unsigned int inputHeight = 1;
int leftPad = 1;
int rightPad = 1;
int topPad = 1;
int botPad = 1;
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
cudaSPadding_kernel<<<gridBlock, threadBlock>>>(nbOutputs,outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,leftPad,rightPad,topPad,botPad,input,outputs);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaSPadding_kernel<<<gridBlock, threadBlock>>>(nbOutputs,outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,leftPad,rightPad,topPad,botPad,input,outputs);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaSPadding_kernel<<<gridBlock, threadBlock>>>(nbOutputs,outputWidth,outputHeight,nbChannels,batchSize,inputWidth,inputHeight,leftPad,rightPad,topPad,botPad,input,outputs);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}