#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeCSRColSums.cu"
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
    float *d_colSums = NULL;
hipMalloc(&d_colSums, XSIZE*YSIZE);
const float *d_systemMatrixVals = NULL;
hipMalloc(&d_systemMatrixVals, XSIZE*YSIZE);
const int *d_systemMatrixRows = NULL;
hipMalloc(&d_systemMatrixRows, XSIZE*YSIZE);
const int *d_systemMatrixCols = NULL;
hipMalloc(&d_systemMatrixCols, XSIZE*YSIZE);
const size_t m = XSIZE*YSIZE;
const size_t n = XSIZE*YSIZE;
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
computeCSRColSums<<<gridBlock, threadBlock>>>(d_colSums,d_systemMatrixVals,d_systemMatrixRows,d_systemMatrixCols,m,n);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeCSRColSums<<<gridBlock, threadBlock>>>(d_colSums,d_systemMatrixVals,d_systemMatrixRows,d_systemMatrixCols,m,n);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeCSRColSums<<<gridBlock, threadBlock>>>(d_colSums,d_systemMatrixVals,d_systemMatrixRows,d_systemMatrixCols,m,n);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}