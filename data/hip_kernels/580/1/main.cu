#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "sum_cc.cu"
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
    float *cc_mat = NULL;
hipMalloc(&cc_mat, XSIZE*YSIZE);
float *cc_sum = NULL;
hipMalloc(&cc_sum, XSIZE*YSIZE);
float *weights = NULL;
hipMalloc(&weights, XSIZE*YSIZE);
int n_stations = 1;
int n_components = 1;
int n_corr = 1;
int chunk_offset = 1;
int chunk_size = XSIZE*YSIZE;
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
sum_cc<<<gridBlock, threadBlock>>>(cc_mat,cc_sum,weights,n_stations,n_components,n_corr,chunk_offset,chunk_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
sum_cc<<<gridBlock, threadBlock>>>(cc_mat,cc_sum,weights,n_stations,n_components,n_corr,chunk_offset,chunk_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
sum_cc<<<gridBlock, threadBlock>>>(cc_mat,cc_sum,weights,n_stations,n_components,n_corr,chunk_offset,chunk_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}