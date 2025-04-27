#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "_bcnn_backward_depthwise_sep_conv_data_kernel_llm.cu"
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
    int nthreads = 1;
float *dst_grad = NULL;
hipMalloc(&dst_grad, XSIZE*YSIZE);
float *weight_data = NULL;
hipMalloc(&weight_data, XSIZE*YSIZE);
int batch_size = XSIZE*YSIZE;
const int channels = 1;
int dst_h = 1;
int dst_w = 1;
const int src_h = 1;
const int src_w = 1;
int kernel_sz = 1;
int stride = 2;
int pad = 2;
float *src_grad = NULL;
hipMalloc(&src_grad, XSIZE*YSIZE);
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
_bcnn_backward_depthwise_sep_conv_data_kernel<<<gridBlock, threadBlock>>>(nthreads,dst_grad,weight_data,batch_size,channels,dst_h,dst_w,src_h,src_w,kernel_sz,stride,pad,src_grad);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
_bcnn_backward_depthwise_sep_conv_data_kernel<<<gridBlock, threadBlock>>>(nthreads,dst_grad,weight_data,batch_size,channels,dst_h,dst_w,src_h,src_w,kernel_sz,stride,pad,src_grad);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
_bcnn_backward_depthwise_sep_conv_data_kernel<<<gridBlock, threadBlock>>>(nthreads,dst_grad,weight_data,batch_size,channels,dst_h,dst_w,src_h,src_w,kernel_sz,stride,pad,src_grad);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}