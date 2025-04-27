#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "HydroUpdatePrim_CUDA3_kernel.cu"
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
    float *Rho = NULL;
hipMalloc(&Rho, XSIZE*YSIZE);
float *Vx = NULL;
hipMalloc(&Vx, XSIZE*YSIZE);
float *Vy = NULL;
hipMalloc(&Vy, XSIZE*YSIZE);
float *Vz = NULL;
hipMalloc(&Vz, XSIZE*YSIZE);
float *Etot = NULL;
hipMalloc(&Etot, XSIZE*YSIZE);
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
float dt = 1;
int size = XSIZE*YSIZE;
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
HydroUpdatePrim_CUDA3_kernel<<<gridBlock, threadBlock>>>(Rho,Vx,Vy,Vz,Etot,dUD,dUS1,dUS2,dUS3,dUTau,dt,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
HydroUpdatePrim_CUDA3_kernel<<<gridBlock, threadBlock>>>(Rho,Vx,Vy,Vz,Etot,dUD,dUS1,dUS2,dUS3,dUTau,dt,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
HydroUpdatePrim_CUDA3_kernel<<<gridBlock, threadBlock>>>(Rho,Vx,Vy,Vz,Etot,dUD,dUS1,dUS2,dUS3,dUTau,dt,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}