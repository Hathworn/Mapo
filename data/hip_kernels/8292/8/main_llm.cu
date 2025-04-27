#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "query_ball_point_gpu_llm.cu"
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
    int b = 2;
int n = XSIZE*YSIZE;
int m = 2;
const float *radius = NULL;
hipMalloc(&radius, XSIZE*YSIZE);
int nsample = 1;
const float *xyz1 = NULL;
hipMalloc(&xyz1, XSIZE*YSIZE);
const float *xyz2 = NULL;
hipMalloc(&xyz2, XSIZE*YSIZE);
int *idx = NULL;
hipMalloc(&idx, XSIZE*YSIZE);
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
query_ball_point_gpu<<<gridBlock, threadBlock>>>(b,n,m,radius,nsample,xyz1,xyz2,idx);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
query_ball_point_gpu<<<gridBlock, threadBlock>>>(b,n,m,radius,nsample,xyz1,xyz2,idx);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
query_ball_point_gpu<<<gridBlock, threadBlock>>>(b,n,m,radius,nsample,xyz1,xyz2,idx);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}