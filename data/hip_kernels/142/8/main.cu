#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "scatterKernel.cu"
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
    const unsigned int *d_In = NULL;
hipMalloc(&d_In, XSIZE*YSIZE);
const unsigned int *d_InPos = NULL;
hipMalloc(&d_InPos, XSIZE*YSIZE);
const unsigned int *d_FalseKeyAddresses = NULL;
hipMalloc(&d_FalseKeyAddresses, XSIZE*YSIZE);
unsigned int *d_Out = NULL;
hipMalloc(&d_Out, XSIZE*YSIZE);
unsigned int *d_OutPos = NULL;
hipMalloc(&d_OutPos, XSIZE*YSIZE);
const unsigned int totalFalses = 1;
size_t size = XSIZE*YSIZE;
unsigned int bitPos = 1;
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
scatterKernel<<<gridBlock, threadBlock>>>(d_In,d_InPos,d_FalseKeyAddresses,d_Out,d_OutPos,totalFalses,size,bitPos);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
scatterKernel<<<gridBlock, threadBlock>>>(d_In,d_InPos,d_FalseKeyAddresses,d_Out,d_OutPos,totalFalses,size,bitPos);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
scatterKernel<<<gridBlock, threadBlock>>>(d_In,d_InPos,d_FalseKeyAddresses,d_Out,d_OutPos,totalFalses,size,bitPos);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}