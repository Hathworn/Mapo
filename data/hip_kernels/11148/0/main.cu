#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "bilinearSamplingFromGrid.cu"
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
    float *inputImages_data = NULL;
hipMalloc(&inputImages_data, XSIZE*YSIZE);
int inputImages_strideBatch = 2;
int inputImages_strideChannels = 2;
int inputImages_strideHeight = YSIZE;
int inputImages_strideWidth = XSIZE;
float *grids_data = NULL;
hipMalloc(&grids_data, XSIZE*YSIZE);
int grids_strideBatch = 2;
int grids_strideYX = 2;
int grids_strideHeight = YSIZE;
int grids_strideWidth = XSIZE;
float *output_data = NULL;
hipMalloc(&output_data, XSIZE*YSIZE);
int output_strideBatch = 2;
int output_strideChannels = 2;
int output_strideHeight = YSIZE;
int output_strideWidth = XSIZE;
int inputImages_channels = 1;
int inputImages_height = YSIZE;
int inputImages_width = XSIZE;
int output_width = XSIZE;
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
bilinearSamplingFromGrid<<<gridBlock, threadBlock>>>(inputImages_data,inputImages_strideBatch,inputImages_strideChannels,inputImages_strideHeight,inputImages_strideWidth,grids_data,grids_strideBatch,grids_strideYX,grids_strideHeight,grids_strideWidth,output_data,output_strideBatch,output_strideChannels,output_strideHeight,output_strideWidth,inputImages_channels,inputImages_height,inputImages_width,output_width);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
bilinearSamplingFromGrid<<<gridBlock, threadBlock>>>(inputImages_data,inputImages_strideBatch,inputImages_strideChannels,inputImages_strideHeight,inputImages_strideWidth,grids_data,grids_strideBatch,grids_strideYX,grids_strideHeight,grids_strideWidth,output_data,output_strideBatch,output_strideChannels,output_strideHeight,output_strideWidth,inputImages_channels,inputImages_height,inputImages_width,output_width);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
bilinearSamplingFromGrid<<<gridBlock, threadBlock>>>(inputImages_data,inputImages_strideBatch,inputImages_strideChannels,inputImages_strideHeight,inputImages_strideWidth,grids_data,grids_strideBatch,grids_strideYX,grids_strideHeight,grids_strideWidth,output_data,output_strideBatch,output_strideChannels,output_strideHeight,output_strideWidth,inputImages_channels,inputImages_height,inputImages_width,output_width);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}