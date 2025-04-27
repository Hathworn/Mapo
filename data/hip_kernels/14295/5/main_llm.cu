#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "scatter_llm.cu"
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
    unsigned int *d_inVals = NULL;
hipMalloc(&d_inVals, XSIZE*YSIZE);
unsigned int *d_outVals = NULL;
hipMalloc(&d_outVals, XSIZE*YSIZE);
unsigned int *d_inPos = NULL;
hipMalloc(&d_inPos, XSIZE*YSIZE);
unsigned int *d_outPos = NULL;
hipMalloc(&d_outPos, XSIZE*YSIZE);
unsigned int *d_zerosScan = NULL;
hipMalloc(&d_zerosScan, XSIZE*YSIZE);
unsigned int *d_onesScan = NULL;
hipMalloc(&d_onesScan, XSIZE*YSIZE);
unsigned int *d_zerosPredicate = NULL;
hipMalloc(&d_zerosPredicate, XSIZE*YSIZE);
unsigned int *d_onesPredicate = NULL;
hipMalloc(&d_onesPredicate, XSIZE*YSIZE);
size_t n = XSIZE*YSIZE;
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
scatter<<<gridBlock, threadBlock>>>(d_inVals,d_outVals,d_inPos,d_outPos,d_zerosScan,d_onesScan,d_zerosPredicate,d_onesPredicate,n);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
scatter<<<gridBlock, threadBlock>>>(d_inVals,d_outVals,d_inPos,d_outPos,d_zerosScan,d_onesScan,d_zerosPredicate,d_onesPredicate,n);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
scatter<<<gridBlock, threadBlock>>>(d_inVals,d_outVals,d_inPos,d_outPos,d_zerosScan,d_onesScan,d_zerosPredicate,d_onesPredicate,n);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}