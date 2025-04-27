#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "bcnn_cuda_axpy_strided_kernel_llm.cu"
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
    int n = XSIZE*YSIZE;
int num_batches = 2;
float a = 2;
float *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
float *y = NULL;
hipMalloc(&y, XSIZE*YSIZE);
int dst_stride = 2;
int src_stride = 2;
int x_c = 1;
int x_h = 1;
int x_w = 1;
int y_c = 1;
int y_h = 1;
int y_w = 1;
int min_c = 1;
int min_h = 1;
int min_w = 1;
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
bcnn_cuda_axpy_strided_kernel<<<gridBlock, threadBlock>>>(n,num_batches,a,x,y,dst_stride,src_stride,x_c,x_h,x_w,y_c,y_h,y_w,min_c,min_h,min_w);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
bcnn_cuda_axpy_strided_kernel<<<gridBlock, threadBlock>>>(n,num_batches,a,x,y,dst_stride,src_stride,x_c,x_h,x_w,y_c,y_h,y_w,min_c,min_h,min_w);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
bcnn_cuda_axpy_strided_kernel<<<gridBlock, threadBlock>>>(n,num_batches,a,x,y,dst_stride,src_stride,x_c,x_h,x_w,y_c,y_h,y_w,min_c,min_h,min_w);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}