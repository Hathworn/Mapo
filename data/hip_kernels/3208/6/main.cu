#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "valid_convolution.cu"
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
    float *d_kernel = NULL;
hipMalloc(&d_kernel, XSIZE*YSIZE);
int k_size = XSIZE*YSIZE;
float *d_matrix = NULL;
hipMalloc(&d_matrix, XSIZE*YSIZE);
int size_x = XSIZE*YSIZE;
int size_y = XSIZE*YSIZE;
float *d_conv = NULL;
hipMalloc(&d_conv, XSIZE*YSIZE);
int max_row = 1;
int max_col = 1;
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
valid_convolution<<<gridBlock, threadBlock>>>(d_kernel,k_size,d_matrix,size_x,size_y,d_conv,max_row,max_col);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
valid_convolution<<<gridBlock, threadBlock>>>(d_kernel,k_size,d_matrix,size_x,size_y,d_conv,max_row,max_col);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
valid_convolution<<<gridBlock, threadBlock>>>(d_kernel,k_size,d_matrix,size_x,size_y,d_conv,max_row,max_col);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}