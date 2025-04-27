#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "addback_spikes_llm.cu"
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
const int *st = NULL;
hipMalloc(&st, XSIZE*YSIZE);
const int *id = NULL;
hipMalloc(&id, XSIZE*YSIZE);
const float *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
const int *count = NULL;
hipMalloc(&count, XSIZE*YSIZE);
float *dataraw = NULL;
hipMalloc(&dataraw, XSIZE*YSIZE);
const float *W = NULL;
hipMalloc(&W, XSIZE*YSIZE);
const float *U = NULL;
hipMalloc(&U, XSIZE*YSIZE);
const int iter = 1;
const float *spkscore = NULL;
hipMalloc(&spkscore, XSIZE*YSIZE);
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
addback_spikes<<<gridBlock, threadBlock>>>(Params,st,id,x,count,dataraw,W,U,iter,spkscore);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
addback_spikes<<<gridBlock, threadBlock>>>(Params,st,id,x,count,dataraw,W,U,iter,spkscore);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
addback_spikes<<<gridBlock, threadBlock>>>(Params,st,id,x,count,dataraw,W,U,iter,spkscore);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}