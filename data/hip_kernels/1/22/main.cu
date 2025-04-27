#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ftest.cu"
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
    int diagFlag = 1;
int p = 1;
int rows = XSIZE;
int colsx = 1;
int colsy = 1;
int rCols = 1;
int unrCols = 1;
float *obs = NULL;
hipMalloc(&obs, XSIZE*YSIZE);
int obsDim = 1;
float *rCoeffs = NULL;
hipMalloc(&rCoeffs, XSIZE*YSIZE);
int rCoeffsDim = 1;
float *unrCoeffs = NULL;
hipMalloc(&unrCoeffs, XSIZE*YSIZE);
int unrCoeffsDim = 1;
float *rdata = NULL;
hipMalloc(&rdata, XSIZE*YSIZE);
int rdataDim = 1;
float *unrdata = NULL;
hipMalloc(&unrdata, XSIZE*YSIZE);
int unrdataDim = 1;
float *dfStats = NULL;
hipMalloc(&dfStats, XSIZE*YSIZE);
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
ftest<<<gridBlock, threadBlock>>>(diagFlag,p,rows,colsx,colsy,rCols,unrCols,obs,obsDim,rCoeffs,rCoeffsDim,unrCoeffs,unrCoeffsDim,rdata,rdataDim,unrdata,unrdataDim,dfStats);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ftest<<<gridBlock, threadBlock>>>(diagFlag,p,rows,colsx,colsy,rCols,unrCols,obs,obsDim,rCoeffs,rCoeffsDim,unrCoeffs,unrCoeffsDim,rdata,rdataDim,unrdata,unrdataDim,dfStats);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ftest<<<gridBlock, threadBlock>>>(diagFlag,p,rows,colsx,colsy,rCols,unrCols,obs,obsDim,rCoeffs,rCoeffsDim,unrCoeffs,unrCoeffsDim,rdata,rdataDim,unrdata,unrdataDim,dfStats);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}