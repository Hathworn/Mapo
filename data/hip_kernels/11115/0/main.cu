#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "prop_gpu.cu"
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
    float *p0 = NULL;
hipMalloc(&p0, XSIZE*YSIZE);
float *p1 = NULL;
hipMalloc(&p1, XSIZE*YSIZE);
float *vel = NULL;
hipMalloc(&vel, XSIZE*YSIZE);
float *coeffs = NULL;
hipMalloc(&coeffs, XSIZE*YSIZE);
int _nx = 1;
int _ny = 1;
int _nz = 1;
int _n12 = 1;
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
prop_gpu<<<gridBlock, threadBlock>>>(p0,p1,vel,coeffs,_nx,_ny,_nz,_n12);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
prop_gpu<<<gridBlock, threadBlock>>>(p0,p1,vel,coeffs,_nx,_ny,_nz,_n12);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
prop_gpu<<<gridBlock, threadBlock>>>(p0,p1,vel,coeffs,_nx,_ny,_nz,_n12);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}