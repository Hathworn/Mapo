#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "tissueGPU3Kernel.cu"
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
    float *d_tissxyz = NULL;
hipMalloc(&d_tissxyz, XSIZE*YSIZE);
float *d_vessxyz = NULL;
hipMalloc(&d_vessxyz, XSIZE*YSIZE);
float *d_pt000 = NULL;
hipMalloc(&d_pt000, XSIZE*YSIZE);
float *d_qv000 = NULL;
hipMalloc(&d_qv000, XSIZE*YSIZE);
int nnt = 1;
int nnv = 1;
int is2d = 1;
float req = 1;
float r2d = 1;
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
tissueGPU3Kernel<<<gridBlock, threadBlock>>>(d_tissxyz,d_vessxyz,d_pt000,d_qv000,nnt,nnv,is2d,req,r2d);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
tissueGPU3Kernel<<<gridBlock, threadBlock>>>(d_tissxyz,d_vessxyz,d_pt000,d_qv000,nnt,nnv,is2d,req,r2d);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
tissueGPU3Kernel<<<gridBlock, threadBlock>>>(d_tissxyz,d_vessxyz,d_pt000,d_qv000,nnt,nnv,is2d,req,r2d);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}