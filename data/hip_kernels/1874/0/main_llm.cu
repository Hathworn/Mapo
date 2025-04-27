#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "initDeviceMemory_llm.cu"
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
    const int nbrOfGrids = 1;
double *d_u1 = NULL;
hipMalloc(&d_u1, XSIZE*YSIZE);
double *d_u2 = NULL;
hipMalloc(&d_u2, XSIZE*YSIZE);
double *d_u3 = NULL;
hipMalloc(&d_u3, XSIZE*YSIZE);
double *d_vol = NULL;
hipMalloc(&d_vol, XSIZE*YSIZE);
double *d_h = NULL;
hipMalloc(&d_h, XSIZE*YSIZE);
double *d_length = NULL;
hipMalloc(&d_length, XSIZE*YSIZE);
double *d_gama = NULL;
hipMalloc(&d_gama, XSIZE*YSIZE);
double *d_cfl = NULL;
hipMalloc(&d_cfl, XSIZE*YSIZE);
double *d_nu = NULL;
hipMalloc(&d_nu, XSIZE*YSIZE);
double *d_tau = NULL;
hipMalloc(&d_tau, XSIZE*YSIZE);
double *d_cMax = NULL;
hipMalloc(&d_cMax, XSIZE*YSIZE);
double *d_t = NULL;
hipMalloc(&d_t, XSIZE*YSIZE);
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
initDeviceMemory<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_vol,d_h,d_length,d_gama,d_cfl,d_nu,d_tau,d_cMax,d_t);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
initDeviceMemory<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_vol,d_h,d_length,d_gama,d_cfl,d_nu,d_tau,d_cMax,d_t);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
initDeviceMemory<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_vol,d_h,d_length,d_gama,d_cfl,d_nu,d_tau,d_cMax,d_t);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}