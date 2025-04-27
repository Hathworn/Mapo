#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "THCudaTensor_kernel_indexFill.cu"
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
    float *tensor = NULL;
hipMalloc(&tensor, XSIZE*YSIZE);
long *stride = NULL;
hipMalloc(&stride, XSIZE*YSIZE);
float *index = NULL;
hipMalloc(&index, XSIZE*YSIZE);
long src_nDim = 1;
int dim = 2;
long idx_size = XSIZE*YSIZE;
long tensor_size = XSIZE*YSIZE;
long size_dim = XSIZE*YSIZE;
float val = 1;
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
THCudaTensor_kernel_indexFill<<<gridBlock, threadBlock>>>(tensor,stride,index,src_nDim,dim,idx_size,tensor_size,size_dim,val);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
THCudaTensor_kernel_indexFill<<<gridBlock, threadBlock>>>(tensor,stride,index,src_nDim,dim,idx_size,tensor_size,size_dim,val);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
THCudaTensor_kernel_indexFill<<<gridBlock, threadBlock>>>(tensor,stride,index,src_nDim,dim,idx_size,tensor_size,size_dim,val);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}