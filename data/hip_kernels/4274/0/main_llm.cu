#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "matting_laplacian_kernel_llm.cu"
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
float *grad = NULL;
hipMalloc(&grad, XSIZE*YSIZE);
int h = YSIZE;
int w = XSIZE;
int *CSR_rowIdx = NULL;
hipMalloc(&CSR_rowIdx, XSIZE*YSIZE);
int *CSR_colIdx = NULL;
hipMalloc(&CSR_colIdx, XSIZE*YSIZE);
float *CSR_val = NULL;
hipMalloc(&CSR_val, XSIZE*YSIZE);
int N = XSIZE*YSIZE;
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
matting_laplacian_kernel<<<gridBlock, threadBlock>>>(input,grad,h,w,CSR_rowIdx,CSR_colIdx,CSR_val,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
matting_laplacian_kernel<<<gridBlock, threadBlock>>>(input,grad,h,w,CSR_rowIdx,CSR_colIdx,CSR_val,N);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
matting_laplacian_kernel<<<gridBlock, threadBlock>>>(input,grad,h,w,CSR_rowIdx,CSR_colIdx,CSR_val,N);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}