#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "UpdateVelocitiesKernel_llm.cu"
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
    double *VthetaInt = NULL;
hipMalloc(&VthetaInt, XSIZE*YSIZE);
double *VradInt = NULL;
hipMalloc(&VradInt, XSIZE*YSIZE);
double *invRmed = NULL;
hipMalloc(&invRmed, XSIZE*YSIZE);
double *Rmed = NULL;
hipMalloc(&Rmed, XSIZE*YSIZE);
double *Rsup = NULL;
hipMalloc(&Rsup, XSIZE*YSIZE);
double *Rinf = NULL;
hipMalloc(&Rinf, XSIZE*YSIZE);
double *invdiffRmed = NULL;
hipMalloc(&invdiffRmed, XSIZE*YSIZE);
double *invdiffRsup = NULL;
hipMalloc(&invdiffRsup, XSIZE*YSIZE);
double *Dens = NULL;
hipMalloc(&Dens, XSIZE*YSIZE);
double *invRinf = NULL;
hipMalloc(&invRinf, XSIZE*YSIZE);
double *TAURR = NULL;
hipMalloc(&TAURR, XSIZE*YSIZE);
double *TAURP = NULL;
hipMalloc(&TAURP, XSIZE*YSIZE);
double *TAUPP = NULL;
hipMalloc(&TAUPP, XSIZE*YSIZE);
double DeltaT = 1;
int nrad = 1;
int nsec = 1;
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
UpdateVelocitiesKernel<<<gridBlock, threadBlock>>>(VthetaInt,VradInt,invRmed,Rmed,Rsup,Rinf,invdiffRmed,invdiffRsup,Dens,invRinf,TAURR,TAURP,TAUPP,DeltaT,nrad,nsec);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
UpdateVelocitiesKernel<<<gridBlock, threadBlock>>>(VthetaInt,VradInt,invRmed,Rmed,Rsup,Rinf,invdiffRmed,invdiffRsup,Dens,invRinf,TAURR,TAURP,TAUPP,DeltaT,nrad,nsec);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
UpdateVelocitiesKernel<<<gridBlock, threadBlock>>>(VthetaInt,VradInt,invRmed,Rmed,Rsup,Rinf,invdiffRmed,invdiffRsup,Dens,invRinf,TAURR,TAURP,TAUPP,DeltaT,nrad,nsec);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}