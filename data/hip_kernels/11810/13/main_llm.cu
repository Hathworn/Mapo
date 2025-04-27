#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_llm.cu"
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
    double *Dens = NULL;
hipMalloc(&Dens, XSIZE*YSIZE);
double *VradInt = NULL;
hipMalloc(&VradInt, XSIZE*YSIZE);
double *VthetaInt = NULL;
hipMalloc(&VthetaInt, XSIZE*YSIZE);
double *TemperInt = NULL;
hipMalloc(&TemperInt, XSIZE*YSIZE);
int nrad = 1;
int nsec = 1;
double *invdiffRmed = NULL;
hipMalloc(&invdiffRmed, XSIZE*YSIZE);
double *invdiffRsup = NULL;
hipMalloc(&invdiffRsup, XSIZE*YSIZE);
double *DensInt = NULL;
hipMalloc(&DensInt, XSIZE*YSIZE);
int Adiabatic = 1;
double *Rmed = NULL;
hipMalloc(&Rmed, XSIZE*YSIZE);
double dt = 1;
double *VradNew = NULL;
hipMalloc(&VradNew, XSIZE*YSIZE);
double *VthetaNew = NULL;
hipMalloc(&VthetaNew, XSIZE*YSIZE);
double *Energy = NULL;
hipMalloc(&Energy, XSIZE*YSIZE);
double *EnergyInt = NULL;
hipMalloc(&EnergyInt, XSIZE*YSIZE);
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
kernel<<<gridBlock, threadBlock>>>(Dens,VradInt,VthetaInt,TemperInt,nrad,nsec,invdiffRmed,invdiffRsup,DensInt,Adiabatic,Rmed,dt,VradNew,VthetaNew,Energy,EnergyInt);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel<<<gridBlock, threadBlock>>>(Dens,VradInt,VthetaInt,TemperInt,nrad,nsec,invdiffRmed,invdiffRsup,DensInt,Adiabatic,Rmed,dt,VradNew,VthetaNew,Energy,EnergyInt);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel<<<gridBlock, threadBlock>>>(Dens,VradInt,VthetaInt,TemperInt,nrad,nsec,invdiffRmed,invdiffRsup,DensInt,Adiabatic,Rmed,dt,VradNew,VthetaNew,Energy,EnergyInt);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}