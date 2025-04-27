#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Substep3Kernel2.cu"
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
double *Qplus = NULL;
hipMalloc(&Qplus, XSIZE*YSIZE);
double *viscosity_array = NULL;
hipMalloc(&viscosity_array, XSIZE*YSIZE);
double *TAURR = NULL;
hipMalloc(&TAURR, XSIZE*YSIZE);
double *TAURP = NULL;
hipMalloc(&TAURP, XSIZE*YSIZE);
double *TAUPP = NULL;
hipMalloc(&TAUPP, XSIZE*YSIZE);
double *DivergenceVelocity = NULL;
hipMalloc(&DivergenceVelocity, XSIZE*YSIZE);
int nrad = 1;
int nsec = 1;
double *Rmed = NULL;
hipMalloc(&Rmed, XSIZE*YSIZE);
int Cooling = 1;
double *EnergyNew = NULL;
hipMalloc(&EnergyNew, XSIZE*YSIZE);
double dt = 1;
double *EnergyMed = NULL;
hipMalloc(&EnergyMed, XSIZE*YSIZE);
double *SigmaMed = NULL;
hipMalloc(&SigmaMed, XSIZE*YSIZE);
double *CoolingTimeMed = NULL;
hipMalloc(&CoolingTimeMed, XSIZE*YSIZE);
double *EnergyInt = NULL;
hipMalloc(&EnergyInt, XSIZE*YSIZE);
double ADIABATICINDEX = 1;
double *QplusMed = NULL;
hipMalloc(&QplusMed, XSIZE*YSIZE);
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
Substep3Kernel2<<<gridBlock, threadBlock>>>(Dens,Qplus,viscosity_array,TAURR,TAURP,TAUPP,DivergenceVelocity,nrad,nsec,Rmed,Cooling,EnergyNew,dt,EnergyMed,SigmaMed,CoolingTimeMed,EnergyInt,ADIABATICINDEX,QplusMed);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Substep3Kernel2<<<gridBlock, threadBlock>>>(Dens,Qplus,viscosity_array,TAURR,TAURP,TAUPP,DivergenceVelocity,nrad,nsec,Rmed,Cooling,EnergyNew,dt,EnergyMed,SigmaMed,CoolingTimeMed,EnergyInt,ADIABATICINDEX,QplusMed);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Substep3Kernel2<<<gridBlock, threadBlock>>>(Dens,Qplus,viscosity_array,TAURR,TAURP,TAUPP,DivergenceVelocity,nrad,nsec,Rmed,Cooling,EnergyNew,dt,EnergyMed,SigmaMed,CoolingTimeMed,EnergyInt,ADIABATICINDEX,QplusMed);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}