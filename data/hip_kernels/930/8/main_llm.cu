#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CorrelateData_llm.cu"
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
    const int nthreads = 1;
int num = 1;
int topwidth = XSIZE;
int topheight = YSIZE;
int topchannels = 1;
int topcount = 1;
int max_displacement = 1;
int neighborhood_grid_radius = 1;
int neighborhood_grid_width = XSIZE;
int kernel_radius = 1;
int kernel_size = XSIZE*YSIZE;
int stride1 = 2;
int stride2 = 2;
int bottomwidth = XSIZE;
int bottomheight = YSIZE;
int bottomchannels = 1;
const float *bottom0 = NULL;
hipMalloc(&bottom0, XSIZE*YSIZE);
const float *bottom1 = NULL;
hipMalloc(&bottom1, XSIZE*YSIZE);
float *top = NULL;
hipMalloc(&top, XSIZE*YSIZE);
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
CorrelateData<<<gridBlock, threadBlock>>>(nthreads,num,topwidth,topheight,topchannels,topcount,max_displacement,neighborhood_grid_radius,neighborhood_grid_width,kernel_radius,kernel_size,stride1,stride2,bottomwidth,bottomheight,bottomchannels,bottom0,bottom1,top);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CorrelateData<<<gridBlock, threadBlock>>>(nthreads,num,topwidth,topheight,topchannels,topcount,max_displacement,neighborhood_grid_radius,neighborhood_grid_width,kernel_radius,kernel_size,stride1,stride2,bottomwidth,bottomheight,bottomchannels,bottom0,bottom1,top);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CorrelateData<<<gridBlock, threadBlock>>>(nthreads,num,topwidth,topheight,topchannels,topcount,max_displacement,neighborhood_grid_radius,neighborhood_grid_width,kernel_radius,kernel_size,stride1,stride2,bottomwidth,bottomheight,bottomchannels,bottom0,bottom1,top);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}