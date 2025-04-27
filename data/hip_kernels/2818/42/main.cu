#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "bcnn_cuda_im2col_kernel.cu"
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
    const int n = 1;
const float *data_im = NULL;
hipMalloc(&data_im, XSIZE*YSIZE);
const int height = 1;
const int width = 1;
const int ksize = 1;
const int pad = 1;
const int stride = 1;
const int height_col = 1;
const int width_col = 1;
float *data_col = NULL;
hipMalloc(&data_col, XSIZE*YSIZE);
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
bcnn_cuda_im2col_kernel<<<gridBlock, threadBlock>>>(n,data_im,height,width,ksize,pad,stride,height_col,width_col,data_col);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
bcnn_cuda_im2col_kernel<<<gridBlock, threadBlock>>>(n,data_im,height,width,ksize,pad,stride,height_col,width_col,data_col);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
bcnn_cuda_im2col_kernel<<<gridBlock, threadBlock>>>(n,data_im,height,width,ksize,pad,stride,height_col,width_col,data_col);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}