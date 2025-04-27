#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "firstPeriodInduction.cu"
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
int nYears = 1;
int noSpecies = 1;
int noControls = 1;
float timeStep = 1;
float unitCost = 1;
float unitRevenue = 1;
float rrr = 1;
int noFuels = 1;
int noCommodities = 1;
float *Q = NULL;
hipMalloc(&Q, XSIZE*YSIZE);
float *fuelCosts = NULL;
hipMalloc(&fuelCosts, XSIZE*YSIZE);
float *totalPops = NULL;
hipMalloc(&totalPops, XSIZE*YSIZE);
float *speciesParams = NULL;
hipMalloc(&speciesParams, XSIZE*YSIZE);
int *controls = NULL;
hipMalloc(&controls, XSIZE*YSIZE);
float *aars = NULL;
hipMalloc(&aars, XSIZE*YSIZE);
float *uComposition = NULL;
hipMalloc(&uComposition, XSIZE*YSIZE);
float *uResults = NULL;
hipMalloc(&uResults, XSIZE*YSIZE);
int *fuelIdx = NULL;
hipMalloc(&fuelIdx, XSIZE*YSIZE);
float *condExp = NULL;
hipMalloc(&condExp, XSIZE*YSIZE);
int *optCont = NULL;
hipMalloc(&optCont, XSIZE*YSIZE);
float *stats = NULL;
hipMalloc(&stats, XSIZE*YSIZE);
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
firstPeriodInduction<<<gridBlock, threadBlock>>>(noPaths,nYears,noSpecies,noControls,timeStep,unitCost,unitRevenue,rrr,noFuels,noCommodities,Q,fuelCosts,totalPops,speciesParams,controls,aars,uComposition,uResults,fuelIdx,condExp,optCont,stats);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
firstPeriodInduction<<<gridBlock, threadBlock>>>(noPaths,nYears,noSpecies,noControls,timeStep,unitCost,unitRevenue,rrr,noFuels,noCommodities,Q,fuelCosts,totalPops,speciesParams,controls,aars,uComposition,uResults,fuelIdx,condExp,optCont,stats);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
firstPeriodInduction<<<gridBlock, threadBlock>>>(noPaths,nYears,noSpecies,noControls,timeStep,unitCost,unitRevenue,rrr,noFuels,noCommodities,Q,fuelCosts,totalPops,speciesParams,controls,aars,uComposition,uResults,fuelIdx,condExp,optCont,stats);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}