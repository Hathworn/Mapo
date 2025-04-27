#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ballquery_batch_p_cuda_.cu"
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
int meanActive = 1;
float radius = 1;
const float *xyz = NULL;
hipMalloc(&xyz, XSIZE*YSIZE);
const int *batch_idxs = NULL;
hipMalloc(&batch_idxs, XSIZE*YSIZE);
const int *batch_offsets = NULL;
hipMalloc(&batch_offsets, XSIZE*YSIZE);
int *idx = NULL;
hipMalloc(&idx, XSIZE*YSIZE);
int *start_len = NULL;
hipMalloc(&start_len, XSIZE*YSIZE);
int *cumsum = NULL;
hipMalloc(&cumsum, XSIZE*YSIZE);
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
ballquery_batch_p_cuda_<<<gridBlock, threadBlock>>>(n,meanActive,radius,xyz,batch_idxs,batch_offsets,idx,start_len,cumsum);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ballquery_batch_p_cuda_<<<gridBlock, threadBlock>>>(n,meanActive,radius,xyz,batch_idxs,batch_offsets,idx,start_len,cumsum);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ballquery_batch_p_cuda_<<<gridBlock, threadBlock>>>(n,meanActive,radius,xyz,batch_idxs,batch_offsets,idx,start_len,cumsum);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}