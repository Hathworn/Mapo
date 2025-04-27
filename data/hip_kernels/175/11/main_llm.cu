#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "FindMaxMinPerGrid_llm.cu"
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
    int p_nGridSize = XSIZE*YSIZE;
int p_nEigNum = 1;
float *p_devMax = NULL;
hipMalloc(&p_devMax, XSIZE*YSIZE);
float *p_devMin = NULL;
hipMalloc(&p_devMin, XSIZE*YSIZE);
float *p_devReduceMax = NULL;
hipMalloc(&p_devReduceMax, XSIZE*YSIZE);
float *p_devReduceMin = NULL;
hipMalloc(&p_devReduceMin, XSIZE*YSIZE);
int p_nMaxLevel = 1;
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
FindMaxMinPerGrid<<<gridBlock, threadBlock>>>(p_nGridSize,p_nEigNum,p_devMax,p_devMin,p_devReduceMax,p_devReduceMin,p_nMaxLevel);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
FindMaxMinPerGrid<<<gridBlock, threadBlock>>>(p_nGridSize,p_nEigNum,p_devMax,p_devMin,p_devReduceMax,p_devReduceMin,p_nMaxLevel);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
FindMaxMinPerGrid<<<gridBlock, threadBlock>>>(p_nGridSize,p_nEigNum,p_devMax,p_devMin,p_devReduceMax,p_devReduceMin,p_nMaxLevel);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}