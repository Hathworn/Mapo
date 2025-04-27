#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_rBRIEF_naive.cu"
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
    float4 *workload = NULL;
hipMalloc(&workload, XSIZE*YSIZE);
int *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
int4 *pattern = NULL;
hipMalloc(&pattern, XSIZE*YSIZE);
int4 *train_bin_vec = NULL;
hipMalloc(&train_bin_vec, XSIZE*YSIZE);
int K = 1;
int P = 1;
int I = 1;
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
gpu_rBRIEF_naive<<<gridBlock, threadBlock>>>(workload,output,pattern,train_bin_vec,K,P,I);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_rBRIEF_naive<<<gridBlock, threadBlock>>>(workload,output,pattern,train_bin_vec,K,P,I);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_rBRIEF_naive<<<gridBlock, threadBlock>>>(workload,output,pattern,train_bin_vec,K,P,I);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}