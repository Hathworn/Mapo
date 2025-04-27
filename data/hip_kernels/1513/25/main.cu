#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "GatherBackwardFuseSgdKernel.cu"
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
    const float *grads = NULL;
hipMalloc(&grads, XSIZE*YSIZE);
int64_t num_features = 1;
int embed_size = XSIZE*YSIZE;
int batch_size = XSIZE*YSIZE;
int query_nnz = 1;
const int64_t *indices = NULL;
hipMalloc(&indices, XSIZE*YSIZE);
float lr = 1;
float *params = NULL;
hipMalloc(&params, XSIZE*YSIZE);
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
GatherBackwardFuseSgdKernel<<<gridBlock, threadBlock>>>(grads,num_features,embed_size,batch_size,query_nnz,indices,lr,params);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
GatherBackwardFuseSgdKernel<<<gridBlock, threadBlock>>>(grads,num_features,embed_size,batch_size,query_nnz,indices,lr,params);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
GatherBackwardFuseSgdKernel<<<gridBlock, threadBlock>>>(grads,num_features,embed_size,batch_size,query_nnz,indices,lr,params);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}