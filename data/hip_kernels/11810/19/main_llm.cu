#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "MinusMeanKernel_llm.cu"
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
double *Energy = NULL;
hipMalloc(&Energy, XSIZE*YSIZE);
double SigmaMed = 1;
double mean_dens_r = 1;
double mean_dens_r2 = 1;
double mean_energy_r = 1;
double mean_energy_r2 = 1;
double EnergyMed = 1;
int nsec = 1;
int nrad = 1;
double SigmaMed2 = 1;
double EnergyMed2 = 1;
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
MinusMeanKernel<<<gridBlock, threadBlock>>>(Dens,Energy,SigmaMed,mean_dens_r,mean_dens_r2,mean_energy_r,mean_energy_r2,EnergyMed,nsec,nrad,SigmaMed2,EnergyMed2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
MinusMeanKernel<<<gridBlock, threadBlock>>>(Dens,Energy,SigmaMed,mean_dens_r,mean_dens_r2,mean_energy_r,mean_energy_r2,EnergyMed,nsec,nrad,SigmaMed2,EnergyMed2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
MinusMeanKernel<<<gridBlock, threadBlock>>>(Dens,Energy,SigmaMed,mean_dens_r,mean_dens_r2,mean_energy_r,mean_energy_r2,EnergyMed,nsec,nrad,SigmaMed2,EnergyMed2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}