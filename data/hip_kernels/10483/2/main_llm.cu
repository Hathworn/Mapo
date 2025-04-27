#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "expPVPath_llm.cu"
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
    const int noPaths = 1;
const float gr = 1;
const int nYears = 1;
const float meanP = 1;
const float timeStep = 1;
const float rrr = 1;
float current = 1;
float reversion = 1;
float jumpProb = 1;
const float *brownian = NULL;
hipMalloc(&brownian, XSIZE*YSIZE);
const float *jumpSize = NULL;
hipMalloc(&jumpSize, XSIZE*YSIZE);
const float *jump = NULL;
hipMalloc(&jump, XSIZE*YSIZE);
float *result = NULL;
hipMalloc(&result, XSIZE*YSIZE);
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
expPVPath<<<gridBlock, threadBlock>>>(noPaths,gr,nYears,meanP,timeStep,rrr,current,reversion,jumpProb,brownian,jumpSize,jump,result);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
expPVPath<<<gridBlock, threadBlock>>>(noPaths,gr,nYears,meanP,timeStep,rrr,current,reversion,jumpProb,brownian,jumpSize,jump,result);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
expPVPath<<<gridBlock, threadBlock>>>(noPaths,gr,nYears,meanP,timeStep,rrr,current,reversion,jumpProb,brownian,jumpSize,jump,result);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}