#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "THCudaTensor_kernel_copy_llm.cu"
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
    float *dst = NULL;
hipMalloc(&dst, XSIZE*YSIZE);
long *dst_sz = NULL;
hipMalloc(&dst_sz, XSIZE*YSIZE);
long *dst_st = NULL;
hipMalloc(&dst_st, XSIZE*YSIZE);
int dst_dim = 1;
float *src = NULL;
hipMalloc(&src, XSIZE*YSIZE);
long *src_sz = NULL;
hipMalloc(&src_sz, XSIZE*YSIZE);
long *src_st = NULL;
hipMalloc(&src_st, XSIZE*YSIZE);
int src_dim = 1;
long n_elem = 1;
long innerdim = 1;
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
THCudaTensor_kernel_copy<<<gridBlock, threadBlock>>>(dst,dst_sz,dst_st,dst_dim,src,src_sz,src_st,src_dim,n_elem,innerdim);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
THCudaTensor_kernel_copy<<<gridBlock, threadBlock>>>(dst,dst_sz,dst_st,dst_dim,src,src_sz,src_st,src_dim,n_elem,innerdim);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
THCudaTensor_kernel_copy<<<gridBlock, threadBlock>>>(dst,dst_sz,dst_st,dst_dim,src,src_sz,src_st,src_dim,n_elem,innerdim);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}