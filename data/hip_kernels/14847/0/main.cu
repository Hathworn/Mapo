#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CudaCompute.cu"
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
    SubBlock *d_sbs = NULL;
hipMalloc(&d_sbs, XSIZE*YSIZE);
float *d_x = NULL;
hipMalloc(&d_x, XSIZE*YSIZE);
float *d_y = NULL;
hipMalloc(&d_y, XSIZE*YSIZE);
int nblocks = 1;
int mem_b_size = XSIZE*YSIZE;
int nrows = 1;
int ncols = 1;
float *sub_y_arr = NULL;
hipMalloc(&sub_y_arr, XSIZE*YSIZE);
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
CudaCompute<<<gridBlock, threadBlock>>>(d_sbs,d_x,d_y,nblocks,mem_b_size,nrows,ncols,sub_y_arr);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CudaCompute<<<gridBlock, threadBlock>>>(d_sbs,d_x,d_y,nblocks,mem_b_size,nrows,ncols,sub_y_arr);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CudaCompute<<<gridBlock, threadBlock>>>(d_sbs,d_x,d_y,nblocks,mem_b_size,nrows,ncols,sub_y_arr);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}