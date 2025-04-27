#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "reduce_max_filter_finalf.cu"
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
    float *g_idata = NULL;
hipMalloc(&g_idata, XSIZE*YSIZE);
float *g_odata = NULL;
hipMalloc(&g_odata, XSIZE*YSIZE);
int *max_idx = NULL;
hipMalloc(&max_idx, XSIZE*YSIZE);
unsigned int n = 1;
unsigned int width = 1;
int blockSize = XSIZE*YSIZE;
int *maxes = NULL;
hipMalloc(&maxes, XSIZE*YSIZE);
int nMax = 1;
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
reduce_max_filter_finalf<<<gridBlock, threadBlock>>>(g_idata,g_odata,max_idx,n,width,blockSize,maxes,nMax);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
reduce_max_filter_finalf<<<gridBlock, threadBlock>>>(g_idata,g_odata,max_idx,n,width,blockSize,maxes,nMax);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
reduce_max_filter_finalf<<<gridBlock, threadBlock>>>(g_idata,g_odata,max_idx,n,width,blockSize,maxes,nMax);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}