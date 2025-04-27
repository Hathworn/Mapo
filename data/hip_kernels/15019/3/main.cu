#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "block_normalization_kernel.cu"
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
    float *histograms = NULL;
hipMalloc(&histograms, XSIZE*YSIZE);
float *descriptor = NULL;
hipMalloc(&descriptor, XSIZE*YSIZE);
int histograms_step = 1;
int block_grid_width = XSIZE;
int block_grid_height = YSIZE;
int block_width = XSIZE;
int block_height = YSIZE;
int num_bins = 1;
int cell_grid_width = XSIZE;
int block_stride_x = 2;
int block_stride_y = 2;
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
block_normalization_kernel<<<gridBlock, threadBlock>>>(histograms,descriptor,histograms_step,block_grid_width,block_grid_height,block_width,block_height,num_bins,cell_grid_width,block_stride_x,block_stride_y);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
block_normalization_kernel<<<gridBlock, threadBlock>>>(histograms,descriptor,histograms_step,block_grid_width,block_grid_height,block_width,block_height,num_bins,cell_grid_width,block_stride_x,block_stride_y);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
block_normalization_kernel<<<gridBlock, threadBlock>>>(histograms,descriptor,histograms_step,block_grid_width,block_grid_height,block_width,block_height,num_bins,cell_grid_width,block_stride_x,block_stride_y);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}