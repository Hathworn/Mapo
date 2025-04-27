#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "psamask_collect_backward_cuda.cu"
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
    const int nthreads = 1;
const int feature_H_ = 1;
const int feature_W_ = 1;
const int mask_H_ = 1;
const int mask_W_ = 1;
const int half_mask_H_ = 1;
const int half_mask_W_ = 1;
const float *buffer_diff = NULL;
hipMalloc(&buffer_diff, XSIZE*YSIZE);
float *mask_diff = NULL;
hipMalloc(&mask_diff, XSIZE*YSIZE);
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
psamask_collect_backward_cuda<<<gridBlock, threadBlock>>>(nthreads,feature_H_,feature_W_,mask_H_,mask_W_,half_mask_H_,half_mask_W_,buffer_diff,mask_diff);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
psamask_collect_backward_cuda<<<gridBlock, threadBlock>>>(nthreads,feature_H_,feature_W_,mask_H_,mask_W_,half_mask_H_,half_mask_W_,buffer_diff,mask_diff);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
psamask_collect_backward_cuda<<<gridBlock, threadBlock>>>(nthreads,feature_H_,feature_W_,mask_H_,mask_W_,half_mask_H_,half_mask_W_,buffer_diff,mask_diff);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}