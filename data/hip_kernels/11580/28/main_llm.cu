#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cuFilterGaussZKernel_32f_C1_llm.cu"
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
    float *dst = NULL;
hipMalloc(&dst, XSIZE*YSIZE);
float *src = NULL;
hipMalloc(&src, XSIZE*YSIZE);
const int y = 1;
const int width = 1;
const int depth = 1;
const size_t stride = XSIZE*YSIZE;
const size_t slice_stride = XSIZE*YSIZE;
float sigma = 1;
int kernel_size = XSIZE*YSIZE;
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
cuFilterGaussZKernel_32f_C1<<<gridBlock, threadBlock>>>(dst,src,y,width,depth,stride,slice_stride,sigma,kernel_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cuFilterGaussZKernel_32f_C1<<<gridBlock, threadBlock>>>(dst,src,y,width,depth,stride,slice_stride,sigma,kernel_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cuFilterGaussZKernel_32f_C1<<<gridBlock, threadBlock>>>(dst,src,y,width,depth,stride,slice_stride,sigma,kernel_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}