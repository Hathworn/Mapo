#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "GPUKernelFunction.cu"
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
    unsigned long long PDH_acnt = 1;
float PDH_res = 1;
atom *atom_list_GPU = NULL;
hipMalloc(&atom_list_GPU, XSIZE*YSIZE);
unsigned long long *histogram_GPU = NULL;
hipMalloc(&histogram_GPU, XSIZE*YSIZE);
int num_buckets = 1;
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
GPUKernelFunction<<<gridBlock, threadBlock>>>(PDH_acnt,PDH_res,atom_list_GPU,histogram_GPU,num_buckets);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
GPUKernelFunction<<<gridBlock, threadBlock>>>(PDH_acnt,PDH_res,atom_list_GPU,histogram_GPU,num_buckets);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
GPUKernelFunction<<<gridBlock, threadBlock>>>(PDH_acnt,PDH_res,atom_list_GPU,histogram_GPU,num_buckets);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}