#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "MSD_GPU_Interpolate_linear_llm.cu"
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
    float *d_MSD_DIT = NULL;
hipMalloc(&d_MSD_DIT, XSIZE*YSIZE);
float *d_MSD_interpolated = NULL;
hipMalloc(&d_MSD_interpolated, XSIZE*YSIZE);
int *d_MSD_DIT_widths = NULL;
hipMalloc(&d_MSD_DIT_widths, XSIZE*YSIZE);
int MSD_DIT_size = XSIZE*YSIZE;
int *boxcar = NULL;
hipMalloc(&boxcar, XSIZE*YSIZE);
int max_width_performed = XSIZE*YSIZE;
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
MSD_GPU_Interpolate_linear<<<gridBlock, threadBlock>>>(d_MSD_DIT,d_MSD_interpolated,d_MSD_DIT_widths,MSD_DIT_size,boxcar,max_width_performed);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
MSD_GPU_Interpolate_linear<<<gridBlock, threadBlock>>>(d_MSD_DIT,d_MSD_interpolated,d_MSD_DIT_widths,MSD_DIT_size,boxcar,max_width_performed);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
MSD_GPU_Interpolate_linear<<<gridBlock, threadBlock>>>(d_MSD_DIT,d_MSD_interpolated,d_MSD_DIT_widths,MSD_DIT_size,boxcar,max_width_performed);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}