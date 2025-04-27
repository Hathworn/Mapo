#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_optflow.cu"
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
    float *d_dx1 = NULL;
hipMalloc(&d_dx1, XSIZE*YSIZE);
float *d_dy1 = NULL;
hipMalloc(&d_dy1, XSIZE*YSIZE);
float *d_dx2 = NULL;
hipMalloc(&d_dx2, XSIZE*YSIZE);
float *d_dy2 = NULL;
hipMalloc(&d_dy2, XSIZE*YSIZE);
float *d_dt = NULL;
hipMalloc(&d_dt, XSIZE*YSIZE);
float4 *uv = NULL;
hipMalloc(&uv, XSIZE*YSIZE);
float4 *uv1 = NULL;
hipMalloc(&uv1, XSIZE*YSIZE);
int H = YSIZE;
int W = XSIZE;
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
kernel_optflow<<<gridBlock, threadBlock>>>(d_dx1,d_dy1,d_dx2,d_dy2,d_dt,uv,uv1,H,W);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_optflow<<<gridBlock, threadBlock>>>(d_dx1,d_dy1,d_dx2,d_dy2,d_dt,uv,uv1,H,W);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_optflow<<<gridBlock, threadBlock>>>(d_dx1,d_dy1,d_dx2,d_dy2,d_dt,uv,uv1,H,W);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}