#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "hessianKernelO_llm.cu"
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
    float *d_output = NULL;
hipMalloc(&d_output, XSIZE*YSIZE);
float *d_output_theta = NULL;
hipMalloc(&d_output_theta, XSIZE*YSIZE);
float *d_output_phi = NULL;
hipMalloc(&d_output_phi, XSIZE*YSIZE);
const float *d_gxx = NULL;
hipMalloc(&d_gxx, XSIZE*YSIZE);
const float *d_gxy = NULL;
hipMalloc(&d_gxy, XSIZE*YSIZE);
const float *d_gxz = NULL;
hipMalloc(&d_gxz, XSIZE*YSIZE);
const float *d_gyy = NULL;
hipMalloc(&d_gyy, XSIZE*YSIZE);
const float *d_gyz = NULL;
hipMalloc(&d_gyz, XSIZE*YSIZE);
const float *d_gzz = NULL;
hipMalloc(&d_gzz, XSIZE*YSIZE);
float sigma = 1;
int imageW = 1;
int imageH = 1;
int imageD = 1;
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
hessianKernelO<<<gridBlock, threadBlock>>>(d_output,d_output_theta,d_output_phi,d_gxx,d_gxy,d_gxz,d_gyy,d_gyz,d_gzz,sigma,imageW,imageH,imageD);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
hessianKernelO<<<gridBlock, threadBlock>>>(d_output,d_output_theta,d_output_phi,d_gxx,d_gxy,d_gxz,d_gyy,d_gyz,d_gzz,sigma,imageW,imageH,imageD);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
hessianKernelO<<<gridBlock, threadBlock>>>(d_output,d_output_theta,d_output_phi,d_gxx,d_gxy,d_gxz,d_gyy,d_gyz,d_gzz,sigma,imageW,imageH,imageD);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}