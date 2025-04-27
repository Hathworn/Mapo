#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CalcEntropy_llm.cu"
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
    double *Entropy_d = NULL;
hipMalloc(&Entropy_d, XSIZE*YSIZE);
double *pressure_d = NULL;
hipMalloc(&pressure_d, XSIZE*YSIZE);
double *temperature_d = NULL;
hipMalloc(&temperature_d, XSIZE*YSIZE);
double Cp = 1;
double Rd = 1;
double A = 2;
double P_Ref = 1;
double *Altitude_d = NULL;
hipMalloc(&Altitude_d, XSIZE*YSIZE);
double *Altitudeh_d = NULL;
hipMalloc(&Altitudeh_d, XSIZE*YSIZE);
double *lonlat_d = NULL;
hipMalloc(&lonlat_d, XSIZE*YSIZE);
double *areasT = NULL;
hipMalloc(&areasT, XSIZE*YSIZE);
double *func_r_d = NULL;
hipMalloc(&func_r_d, XSIZE*YSIZE);
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
CalcEntropy<<<gridBlock, threadBlock>>>(Entropy_d,pressure_d,temperature_d,Cp,Rd,A,P_Ref,Altitude_d,Altitudeh_d,lonlat_d,areasT,func_r_d,num,DeepModel);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CalcEntropy<<<gridBlock, threadBlock>>>(Entropy_d,pressure_d,temperature_d,Cp,Rd,A,P_Ref,Altitude_d,Altitudeh_d,lonlat_d,areasT,func_r_d,num,DeepModel);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CalcEntropy<<<gridBlock, threadBlock>>>(Entropy_d,pressure_d,temperature_d,Cp,Rd,A,P_Ref,Altitude_d,Altitudeh_d,lonlat_d,areasT,func_r_d,num,DeepModel);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}