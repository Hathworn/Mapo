#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "get_bin_scores.cu"
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
    int nbins = 1;
int order = 1;
int nknots = 1;
float *knots = NULL;
hipMalloc(&knots, XSIZE*YSIZE);
int nsamples = 1;
int nx = 1;
float *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
int pitch_x = 2;
float *bins = NULL;
hipMalloc(&bins, XSIZE*YSIZE);
int pitch_bins = 2;
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
get_bin_scores<<<gridBlock, threadBlock>>>(nbins,order,nknots,knots,nsamples,nx,x,pitch_x,bins,pitch_bins);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
get_bin_scores<<<gridBlock, threadBlock>>>(nbins,order,nknots,knots,nsamples,nx,x,pitch_x,bins,pitch_bins);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
get_bin_scores<<<gridBlock, threadBlock>>>(nbins,order,nknots,knots,nsamples,nx,x,pitch_x,bins,pitch_bins);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}