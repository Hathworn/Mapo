#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "tissueGPU4Kernel.cu"
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
    int *d_tisspoints = NULL;
hipMalloc(&d_tisspoints, XSIZE*YSIZE);
float *d_dtt000 = NULL;
hipMalloc(&d_dtt000, XSIZE*YSIZE);
float *d_qtp000 = NULL;
hipMalloc(&d_qtp000, XSIZE*YSIZE);
float *d_xt = NULL;
hipMalloc(&d_xt, XSIZE*YSIZE);
float *d_rt = NULL;
hipMalloc(&d_rt, XSIZE*YSIZE);
int nnt = 1;
int step = 1;
float diff = 1;
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
tissueGPU4Kernel<<<gridBlock, threadBlock>>>(d_tisspoints,d_dtt000,d_qtp000,d_xt,d_rt,nnt,step,diff);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
tissueGPU4Kernel<<<gridBlock, threadBlock>>>(d_tisspoints,d_dtt000,d_qtp000,d_xt,d_rt,nnt,step,diff);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
tissueGPU4Kernel<<<gridBlock, threadBlock>>>(d_tisspoints,d_dtt000,d_qtp000,d_xt,d_rt,nnt,step,diff);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}