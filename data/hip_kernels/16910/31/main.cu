#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "average_snips_v3.cu"
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
const int *ioff = NULL;
hipMalloc(&ioff, XSIZE*YSIZE);
const int *id = NULL;
hipMalloc(&id, XSIZE*YSIZE);
const float *uproj = NULL;
hipMalloc(&uproj, XSIZE*YSIZE);
const float *cmax = NULL;
hipMalloc(&cmax, XSIZE*YSIZE);
float *bigArray = NULL;
hipMalloc(&bigArray, XSIZE*YSIZE);
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
average_snips_v3<<<gridBlock, threadBlock>>>(Params,ioff,id,uproj,cmax,bigArray);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
average_snips_v3<<<gridBlock, threadBlock>>>(Params,ioff,id,uproj,cmax,bigArray);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
average_snips_v3<<<gridBlock, threadBlock>>>(Params,ioff,id,uproj,cmax,bigArray);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}