#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeCost.cu"
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
    const double *Params = NULL;
hipMalloc(&Params, XSIZE*YSIZE);
const float *uproj = NULL;
hipMalloc(&uproj, XSIZE*YSIZE);
const float *mu = NULL;
hipMalloc(&mu, XSIZE*YSIZE);
const float *W = NULL;
hipMalloc(&W, XSIZE*YSIZE);
const bool *match = NULL;
hipMalloc(&match, XSIZE*YSIZE);
const int *iC = NULL;
hipMalloc(&iC, XSIZE*YSIZE);
const int *call = NULL;
hipMalloc(&call, XSIZE*YSIZE);
float *cmax = NULL;
hipMalloc(&cmax, XSIZE*YSIZE);
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
computeCost<<<gridBlock, threadBlock>>>(Params,uproj,mu,W,match,iC,call,cmax);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeCost<<<gridBlock, threadBlock>>>(Params,uproj,mu,W,match,iC,call,cmax);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeCost<<<gridBlock, threadBlock>>>(Params,uproj,mu,W,match,iC,call,cmax);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}