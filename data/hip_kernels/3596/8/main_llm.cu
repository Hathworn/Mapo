#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "MHDComputedUz_CUDA3_kernel_llm.cu"
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
    float *FluxD = NULL;
hipMalloc(&FluxD, XSIZE*YSIZE);
float *FluxS1 = NULL;
hipMalloc(&FluxS1, XSIZE*YSIZE);
float *FluxS2 = NULL;
hipMalloc(&FluxS2, XSIZE*YSIZE);
float *FluxS3 = NULL;
hipMalloc(&FluxS3, XSIZE*YSIZE);
float *FluxTau = NULL;
hipMalloc(&FluxTau, XSIZE*YSIZE);
float *FluxBx = NULL;
hipMalloc(&FluxBx, XSIZE*YSIZE);
float *FluxBy = NULL;
hipMalloc(&FluxBy, XSIZE*YSIZE);
float *FluxBz = NULL;
hipMalloc(&FluxBz, XSIZE*YSIZE);
float *FluxPhi = NULL;
hipMalloc(&FluxPhi, XSIZE*YSIZE);
float *dUD = NULL;
hipMalloc(&dUD, XSIZE*YSIZE);
float *dUS1 = NULL;
hipMalloc(&dUS1, XSIZE*YSIZE);
float *dUS2 = NULL;
hipMalloc(&dUS2, XSIZE*YSIZE);
float *dUS3 = NULL;
hipMalloc(&dUS3, XSIZE*YSIZE);
float *dUTau = NULL;
hipMalloc(&dUTau, XSIZE*YSIZE);
float *dUBx = NULL;
hipMalloc(&dUBx, XSIZE*YSIZE);
float *dUBy = NULL;
hipMalloc(&dUBy, XSIZE*YSIZE);
float *dUBz = NULL;
hipMalloc(&dUBz, XSIZE*YSIZE);
float *dUPhi = NULL;
hipMalloc(&dUPhi, XSIZE*YSIZE);
float dtdx = 1;
int size = XSIZE*YSIZE;
int dim0 = 1;
int dim1 = 1;
int dim2 = 1;
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
MHDComputedUz_CUDA3_kernel<<<gridBlock, threadBlock>>>(FluxD,FluxS1,FluxS2,FluxS3,FluxTau,FluxBx,FluxBy,FluxBz,FluxPhi,dUD,dUS1,dUS2,dUS3,dUTau,dUBx,dUBy,dUBz,dUPhi,dtdx,size,dim0,dim1,dim2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
MHDComputedUz_CUDA3_kernel<<<gridBlock, threadBlock>>>(FluxD,FluxS1,FluxS2,FluxS3,FluxTau,FluxBx,FluxBy,FluxBz,FluxPhi,dUD,dUS1,dUS2,dUS3,dUTau,dUBx,dUBy,dUBz,dUPhi,dtdx,size,dim0,dim1,dim2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
MHDComputedUz_CUDA3_kernel<<<gridBlock, threadBlock>>>(FluxD,FluxS1,FluxS2,FluxS3,FluxTau,FluxBx,FluxBy,FluxBz,FluxPhi,dUD,dUS1,dUS2,dUS3,dUTau,dUBx,dUBy,dUBz,dUPhi,dtdx,size,dim0,dim1,dim2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}