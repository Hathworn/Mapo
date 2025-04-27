#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "NmDistanceGradKernel.cu"
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
    int b = 2;
int n = XSIZE*YSIZE;
const float *xyz1 = NULL;
hipMalloc(&xyz1, XSIZE*YSIZE);
int m = 2;
const float *xyz2 = NULL;
hipMalloc(&xyz2, XSIZE*YSIZE);
const float *grad_dist1 = NULL;
hipMalloc(&grad_dist1, XSIZE*YSIZE);
const int *idx1 = NULL;
hipMalloc(&idx1, XSIZE*YSIZE);
float *grad_xyz1 = NULL;
hipMalloc(&grad_xyz1, XSIZE*YSIZE);
float *grad_xyz2 = NULL;
hipMalloc(&grad_xyz2, XSIZE*YSIZE);
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
NmDistanceGradKernel<<<gridBlock, threadBlock>>>(b,n,xyz1,m,xyz2,grad_dist1,idx1,grad_xyz1,grad_xyz2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
NmDistanceGradKernel<<<gridBlock, threadBlock>>>(b,n,xyz1,m,xyz2,grad_dist1,idx1,grad_xyz1,grad_xyz2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
NmDistanceGradKernel<<<gridBlock, threadBlock>>>(b,n,xyz1,m,xyz2,grad_dist1,idx1,grad_xyz1,grad_xyz2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}