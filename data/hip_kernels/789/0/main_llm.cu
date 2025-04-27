#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "loss_kernel_llm.cu"
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
    int factors = 1;
int user_count = 1;
int item_count = 1;
const float *P = NULL;
hipMalloc(&P, XSIZE*YSIZE);
const float *Q = NULL;
hipMalloc(&Q, XSIZE*YSIZE);
const int *indptr = NULL;
hipMalloc(&indptr, XSIZE*YSIZE);
const int *indices = NULL;
hipMalloc(&indices, XSIZE*YSIZE);
const float *data = NULL;
hipMalloc(&data, XSIZE*YSIZE);
float *error = NULL;
hipMalloc(&error, XSIZE*YSIZE);
float *user_bias = NULL;
hipMalloc(&user_bias, XSIZE*YSIZE);
float *item_bias = NULL;
hipMalloc(&item_bias, XSIZE*YSIZE);
float global_bias = 1;
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
loss_kernel<<<gridBlock, threadBlock>>>(factors,user_count,item_count,P,Q,indptr,indices,data,error,user_bias,item_bias,global_bias);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
loss_kernel<<<gridBlock, threadBlock>>>(factors,user_count,item_count,P,Q,indptr,indices,data,error,user_bias,item_bias,global_bias);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
loss_kernel<<<gridBlock, threadBlock>>>(factors,user_count,item_count,P,Q,indptr,indices,data,error,user_bias,item_bias,global_bias);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}