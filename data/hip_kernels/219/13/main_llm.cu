#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "LinearBinning_llm.cu"
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
    float *vec = NULL;
hipMalloc(&vec, XSIZE*YSIZE);
int *bin = NULL;
hipMalloc(&bin, XSIZE*YSIZE);
int *bin_counters = NULL;
hipMalloc(&bin_counters, XSIZE*YSIZE);
const int num_bins = 1;
const int MaxBin = 1;
const int n = 1;
const float slope = 1;
const float intercept = 1;
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
LinearBinning<<<gridBlock, threadBlock>>>(vec,bin,bin_counters,num_bins,MaxBin,n,slope,intercept);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
LinearBinning<<<gridBlock, threadBlock>>>(vec,bin,bin_counters,num_bins,MaxBin,n,slope,intercept);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
LinearBinning<<<gridBlock, threadBlock>>>(vec,bin,bin_counters,num_bins,MaxBin,n,slope,intercept);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}