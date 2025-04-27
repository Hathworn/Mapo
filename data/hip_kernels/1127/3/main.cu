#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CalcMass.cu"
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
    double *Mass_d = NULL;
hipMalloc(&Mass_d, XSIZE*YSIZE);
double *GlobalMass_d = NULL;
hipMalloc(&GlobalMass_d, XSIZE*YSIZE);
double *Rho_d = NULL;
hipMalloc(&Rho_d, XSIZE*YSIZE);
double A = 2;
double *Altitudeh_d = NULL;
hipMalloc(&Altitudeh_d, XSIZE*YSIZE);
double *lonlat_d = NULL;
hipMalloc(&lonlat_d, XSIZE*YSIZE);
double *areasT = NULL;
hipMalloc(&areasT, XSIZE*YSIZE);
int num = 1;
bool DeepModel = 1;
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
CalcMass<<<gridBlock, threadBlock>>>(Mass_d,GlobalMass_d,Rho_d,A,Altitudeh_d,lonlat_d,areasT,num,DeepModel);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CalcMass<<<gridBlock, threadBlock>>>(Mass_d,GlobalMass_d,Rho_d,A,Altitudeh_d,lonlat_d,areasT,num,DeepModel);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CalcMass<<<gridBlock, threadBlock>>>(Mass_d,GlobalMass_d,Rho_d,A,Altitudeh_d,lonlat_d,areasT,num,DeepModel);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}