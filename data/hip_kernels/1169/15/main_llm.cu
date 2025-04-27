#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Normalize3DKernel_llm.cu"
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
    const unsigned short *d_src = NULL;
hipMalloc(&d_src, XSIZE*YSIZE);
const float *d_erosion = NULL;
hipMalloc(&d_erosion, XSIZE*YSIZE);
const float *d_dilation = NULL;
hipMalloc(&d_dilation, XSIZE*YSIZE);
float *d_dst = NULL;
hipMalloc(&d_dst, XSIZE*YSIZE);
float min_intensity = 1;
const int width = 1;
const int height = 1;
const int depth = 1;
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
Normalize3DKernel<<<gridBlock, threadBlock>>>(d_src,d_erosion,d_dilation,d_dst,min_intensity,width,height,depth);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Normalize3DKernel<<<gridBlock, threadBlock>>>(d_src,d_erosion,d_dilation,d_dst,min_intensity,width,height,depth);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Normalize3DKernel<<<gridBlock, threadBlock>>>(d_src,d_erosion,d_dilation,d_dst,min_intensity,width,height,depth);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}