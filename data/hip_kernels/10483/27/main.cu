#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "buildGlobalQuadReg.cu"
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
    int noPoints = 1;
int noDims = 1;
int dimRes = 1;
int nYears = 1;
int noControls = 1;
int year = 1;
int control = 1;
float *regCoeffs = NULL;
hipMalloc(&regCoeffs, XSIZE*YSIZE);
float *xmins = NULL;
hipMalloc(&xmins, XSIZE*YSIZE);
float *xmaxes = NULL;
hipMalloc(&xmaxes, XSIZE*YSIZE);
float *regression = NULL;
hipMalloc(&regression, XSIZE*YSIZE);
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
buildGlobalQuadReg<<<gridBlock, threadBlock>>>(noPoints,noDims,dimRes,nYears,noControls,year,control,regCoeffs,xmins,xmaxes,regression);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
buildGlobalQuadReg<<<gridBlock, threadBlock>>>(noPoints,noDims,dimRes,nYears,noControls,year,control,regCoeffs,xmins,xmaxes,regression);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
buildGlobalQuadReg<<<gridBlock, threadBlock>>>(noPoints,noDims,dimRes,nYears,noControls,year,control,regCoeffs,xmins,xmaxes,regression);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}