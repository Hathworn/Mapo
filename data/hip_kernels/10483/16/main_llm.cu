#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "forwardPathKernel_llm.cu"
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
int noPatches = 1;
int noControls = 1;
int noUncertainties = 1;
float timeStep = 1;
float *initPops = NULL;
hipMalloc(&initPops, XSIZE*YSIZE);
float *pops = NULL;
hipMalloc(&pops, XSIZE*YSIZE);
float *mmm = NULL;
hipMalloc(&mmm, XSIZE*YSIZE);
int *rowIdx = NULL;
hipMalloc(&rowIdx, XSIZE*YSIZE);
int *elemsPerCol = NULL;
hipMalloc(&elemsPerCol, XSIZE*YSIZE);
int maxElems = 1;
float *speciesParams = NULL;
hipMalloc(&speciesParams, XSIZE*YSIZE);
float *caps = NULL;
hipMalloc(&caps, XSIZE*YSIZE);
float *aars = NULL;
hipMalloc(&aars, XSIZE*YSIZE);
float *uncertParams = NULL;
hipMalloc(&uncertParams, XSIZE*YSIZE);
int *controls = NULL;
hipMalloc(&controls, XSIZE*YSIZE);
float *uJumps = NULL;
hipMalloc(&uJumps, XSIZE*YSIZE);
float *uBrownian = NULL;
hipMalloc(&uBrownian, XSIZE*YSIZE);
float *uJumpSizes = NULL;
hipMalloc(&uJumpSizes, XSIZE*YSIZE);
float *uJumpsSpecies = NULL;
hipMalloc(&uJumpsSpecies, XSIZE*YSIZE);
float *uBrownianSpecies = NULL;
hipMalloc(&uBrownianSpecies, XSIZE*YSIZE);
float *uJumpSizesSpecies = NULL;
hipMalloc(&uJumpSizesSpecies, XSIZE*YSIZE);
float *rgr = NULL;
hipMalloc(&rgr, XSIZE*YSIZE);
float *uResults = NULL;
hipMalloc(&uResults, XSIZE*YSIZE);
float *totalPops = NULL;
hipMalloc(&totalPops, XSIZE*YSIZE);
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
forwardPathKernel<<<gridBlock, threadBlock>>>(noPaths,nYears,noSpecies,noPatches,noControls,noUncertainties,timeStep,initPops,pops,mmm,rowIdx,elemsPerCol,maxElems,speciesParams,caps,aars,uncertParams,controls,uJumps,uBrownian,uJumpSizes,uJumpsSpecies,uBrownianSpecies,uJumpSizesSpecies,rgr,uResults,totalPops);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
forwardPathKernel<<<gridBlock, threadBlock>>>(noPaths,nYears,noSpecies,noPatches,noControls,noUncertainties,timeStep,initPops,pops,mmm,rowIdx,elemsPerCol,maxElems,speciesParams,caps,aars,uncertParams,controls,uJumps,uBrownian,uJumpSizes,uJumpsSpecies,uBrownianSpecies,uJumpSizesSpecies,rgr,uResults,totalPops);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
forwardPathKernel<<<gridBlock, threadBlock>>>(noPaths,nYears,noSpecies,noPatches,noControls,noUncertainties,timeStep,initPops,pops,mmm,rowIdx,elemsPerCol,maxElems,speciesParams,caps,aars,uncertParams,controls,uJumps,uBrownian,uJumpSizes,uJumpsSpecies,uBrownianSpecies,uJumpSizesSpecies,rgr,uResults,totalPops);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}