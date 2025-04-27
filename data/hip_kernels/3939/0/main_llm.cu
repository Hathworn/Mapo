#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "convolution_kernel_llm.cu"
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
    int h = YSIZE;
int w = XSIZE;
int d = 1;
double *gpu_in = NULL;
hipMalloc(&gpu_in, XSIZE*YSIZE);
int k_h = 1;
int k_w = 1;
int k_d = 1;
double *kernel_weights = NULL;
hipMalloc(&kernel_weights, XSIZE*YSIZE);
double *kernel_biases = NULL;
hipMalloc(&kernel_biases, XSIZE*YSIZE);
int num_kernels = 1;
int op_h = 1;
int op_w = 1;
int op_d = 1;
double *gpu_out = NULL;
hipMalloc(&gpu_out, XSIZE*YSIZE);
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
convolution_kernel<<<gridBlock, threadBlock>>>(h,w,d,gpu_in,k_h,k_w,k_d,kernel_weights,kernel_biases,num_kernels,op_h,op_w,op_d,gpu_out);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
convolution_kernel<<<gridBlock, threadBlock>>>(h,w,d,gpu_in,k_h,k_w,k_d,kernel_weights,kernel_biases,num_kernels,op_h,op_w,op_d,gpu_out);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
convolution_kernel<<<gridBlock, threadBlock>>>(h,w,d,gpu_in,k_h,k_w,k_d,kernel_weights,kernel_biases,num_kernels,op_h,op_w,op_d,gpu_out);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}