#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cuSincInterpolation_kernel.cu"
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
    const int nImages = 1;
const float *imagesIn = NULL;
hipMalloc(&imagesIn, XSIZE*YSIZE);
const int inNX = 1;
const int inNY = 1;
float *imagesOut = NULL;
hipMalloc(&imagesOut, XSIZE*YSIZE);
const int outNX = 1;
const int outNY = 1;
const float *r_filter_ = NULL;
hipMalloc(&r_filter_, XSIZE*YSIZE);
const int i_covs_ = 1;
const int i_decfactor_ = 1;
const int i_intplength_ = 1;
const int i_startX = 1;
const int i_startY = 1;
const int i_int_size = 1;
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
cuSincInterpolation_kernel<<<gridBlock, threadBlock>>>(nImages,imagesIn,inNX,inNY,imagesOut,outNX,outNY,r_filter_,i_covs_,i_decfactor_,i_intplength_,i_startX,i_startY,i_int_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cuSincInterpolation_kernel<<<gridBlock, threadBlock>>>(nImages,imagesIn,inNX,inNY,imagesOut,outNX,outNY,r_filter_,i_covs_,i_decfactor_,i_intplength_,i_startX,i_startY,i_int_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cuSincInterpolation_kernel<<<gridBlock, threadBlock>>>(nImages,imagesIn,inNX,inNY,imagesOut,outNX,outNY,r_filter_,i_covs_,i_decfactor_,i_intplength_,i_startX,i_startY,i_int_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}