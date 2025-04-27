#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computePathStates.cu"
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
    int noPaths = 1;
int noDims = 1;
int nYears = 1;
int noControls = 1;
int year = 1;
float unitCost = 1;
float unitRevenue = 1;
int *controls = NULL;
hipMalloc(&controls, XSIZE*YSIZE);
int noFuels = 1;
float *fuelCosts = NULL;
hipMalloc(&fuelCosts, XSIZE*YSIZE);
float *uResults = NULL;
hipMalloc(&uResults, XSIZE*YSIZE);
float *uComposition = NULL;
hipMalloc(&uComposition, XSIZE*YSIZE);
int noUncertainties = 1;
int *fuelIdx = NULL;
hipMalloc(&fuelIdx, XSIZE*YSIZE);
int noCommodities = 1;
float *aars = NULL;
hipMalloc(&aars, XSIZE*YSIZE);
float *totalPops = NULL;
hipMalloc(&totalPops, XSIZE*YSIZE);
float *xin = NULL;
hipMalloc(&xin, XSIZE*YSIZE);
int *currControls = NULL;
hipMalloc(&currControls, XSIZE*YSIZE);
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
computePathStates<<<gridBlock, threadBlock>>>(noPaths,noDims,nYears,noControls,year,unitCost,unitRevenue,controls,noFuels,fuelCosts,uResults,uComposition,noUncertainties,fuelIdx,noCommodities,aars,totalPops,xin,currControls);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computePathStates<<<gridBlock, threadBlock>>>(noPaths,noDims,nYears,noControls,year,unitCost,unitRevenue,controls,noFuels,fuelCosts,uResults,uComposition,noUncertainties,fuelIdx,noCommodities,aars,totalPops,xin,currControls);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computePathStates<<<gridBlock, threadBlock>>>(noPaths,noDims,nYears,noControls,year,unitCost,unitRevenue,controls,noFuels,fuelCosts,uResults,uComposition,noUncertainties,fuelIdx,noCommodities,aars,totalPops,xin,currControls);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}