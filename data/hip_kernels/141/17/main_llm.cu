#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "subgradweight_llm.cu"
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
float *gradOutput = NULL;
hipMalloc(&gradOutput, XSIZE*YSIZE);
float *gradWeight = NULL;
hipMalloc(&gradWeight, XSIZE*YSIZE);
float *gradBias = NULL;
hipMalloc(&gradBias, XSIZE*YSIZE);
int input_n = 1;
int input_h = 1;
int input_w = 1;
int kH = 1;
int kW = 1;
int dH = 1;
int dW = 1;
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
subgradweight<<<gridBlock, threadBlock>>>(input,gradOutput,gradWeight,gradBias,input_n,input_h,input_w,kH,kW,dH,dW,scale);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
subgradweight<<<gridBlock, threadBlock>>>(input,gradOutput,gradWeight,gradBias,input_n,input_h,input_w,kH,kW,dH,dW,scale);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
subgradweight<<<gridBlock, threadBlock>>>(input,gradOutput,gradWeight,gradBias,input_n,input_h,input_w,kH,kW,dH,dW,scale);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}