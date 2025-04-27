#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "get_mi_llm.cu"
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
int nsamples = 1;
int nx = 1;
float *x_bin_scores = NULL;
hipMalloc(&x_bin_scores, XSIZE*YSIZE);
int pitch_x_bin_scores = 2;
float *entropies_x = NULL;
hipMalloc(&entropies_x, XSIZE*YSIZE);
int ny = 1;
float *y_bin_scores = NULL;
hipMalloc(&y_bin_scores, XSIZE*YSIZE);
int pitch_y_bin_scores = 2;
float *entropies_y = NULL;
hipMalloc(&entropies_y, XSIZE*YSIZE);
float *mis = NULL;
hipMalloc(&mis, XSIZE*YSIZE);
int pitch_mis = 2;
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
get_mi<<<gridBlock, threadBlock>>>(nbins,nsamples,nx,x_bin_scores,pitch_x_bin_scores,entropies_x,ny,y_bin_scores,pitch_y_bin_scores,entropies_y,mis,pitch_mis);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
get_mi<<<gridBlock, threadBlock>>>(nbins,nsamples,nx,x_bin_scores,pitch_x_bin_scores,entropies_x,ny,y_bin_scores,pitch_y_bin_scores,entropies_y,mis,pitch_mis);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
get_mi<<<gridBlock, threadBlock>>>(nbins,nsamples,nx,x_bin_scores,pitch_x_bin_scores,entropies_x,ny,y_bin_scores,pitch_y_bin_scores,entropies_y,mis,pitch_mis);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}