#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "backward_maxpool_layer_kernel.cu"
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
    int n = XSIZE*YSIZE;
int in_h = 1;
int in_w = 1;
int in_c = 1;
int stride = 2;
int size = XSIZE*YSIZE;
int pad = 2;
float *delta = NULL;
hipMalloc(&delta, XSIZE*YSIZE);
float *prev_delta = NULL;
hipMalloc(&prev_delta, XSIZE*YSIZE);
int *indexes = NULL;
hipMalloc(&indexes, XSIZE*YSIZE);
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
backward_maxpool_layer_kernel<<<gridBlock, threadBlock>>>(n,in_h,in_w,in_c,stride,size,pad,delta,prev_delta,indexes);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
backward_maxpool_layer_kernel<<<gridBlock, threadBlock>>>(n,in_h,in_w,in_c,stride,size,pad,delta,prev_delta,indexes);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
backward_maxpool_layer_kernel<<<gridBlock, threadBlock>>>(n,in_h,in_w,in_c,stride,size,pad,delta,prev_delta,indexes);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}