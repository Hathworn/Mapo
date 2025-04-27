#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "atomicadaptivemaxgradinput_llm.cu"
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
float *gradOutput = NULL;
hipMalloc(&gradOutput, XSIZE*YSIZE);
float *indices_x = NULL;
hipMalloc(&indices_x, XSIZE*YSIZE);
float *indices_y = NULL;
hipMalloc(&indices_y, XSIZE*YSIZE);
int input_n = 1;
int input_h = 1;
int input_w = 1;
int output_h = 1;
int output_w = 1;
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
atomicadaptivemaxgradinput<<<gridBlock, threadBlock>>>(gradInput,gradOutput,indices_x,indices_y,input_n,input_h,input_w,output_h,output_w);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
atomicadaptivemaxgradinput<<<gridBlock, threadBlock>>>(gradInput,gradOutput,indices_x,indices_y,input_n,input_h,input_w,output_h,output_w);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
atomicadaptivemaxgradinput<<<gridBlock, threadBlock>>>(gradInput,gradOutput,indices_x,indices_y,input_n,input_h,input_w,output_h,output_w);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}