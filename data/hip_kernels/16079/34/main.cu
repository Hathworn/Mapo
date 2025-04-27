#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "TgvThresholdingL1MaskedKernel.cu"
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
    float2 *Tp = NULL;
hipMalloc(&Tp, XSIZE*YSIZE);
float *u_ = NULL;
hipMalloc(&u_, XSIZE*YSIZE);
float *Iu = NULL;
hipMalloc(&Iu, XSIZE*YSIZE);
float *Iz = NULL;
hipMalloc(&Iz, XSIZE*YSIZE);
float *mask = NULL;
hipMalloc(&mask, XSIZE*YSIZE);
float lambda = 1;
float tau = 1;
float *eta_u = NULL;
hipMalloc(&eta_u, XSIZE*YSIZE);
float *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
float *us = NULL;
hipMalloc(&us, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
int stride = 2;
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
TgvThresholdingL1MaskedKernel<<<gridBlock, threadBlock>>>(Tp,u_,Iu,Iz,mask,lambda,tau,eta_u,u,us,width,height,stride);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
TgvThresholdingL1MaskedKernel<<<gridBlock, threadBlock>>>(Tp,u_,Iu,Iz,mask,lambda,tau,eta_u,u,us,width,height,stride);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
TgvThresholdingL1MaskedKernel<<<gridBlock, threadBlock>>>(Tp,u_,Iu,Iz,mask,lambda,tau,eta_u,u,us,width,height,stride);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}