#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "findMaxAbs.cu"
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
    int nRxns = 1;
double *d_umat2 = NULL;
hipMalloc(&d_umat2, XSIZE*YSIZE);
int nMets = 1;
int *d_rowVec = NULL;
hipMalloc(&d_rowVec, XSIZE*YSIZE);
int *d_colVec = NULL;
hipMalloc(&d_colVec, XSIZE*YSIZE);
double *d_val = NULL;
hipMalloc(&d_val, XSIZE*YSIZE);
int nnz = 1;
double *points = NULL;
hipMalloc(&points, XSIZE*YSIZE);
int pointsPerFile = 1;
int pointCount = 1;
int index = 1;
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
findMaxAbs<<<gridBlock, threadBlock>>>(nRxns,d_umat2,nMets,d_rowVec,d_colVec,d_val,nnz,points,pointsPerFile,pointCount,index);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
findMaxAbs<<<gridBlock, threadBlock>>>(nRxns,d_umat2,nMets,d_rowVec,d_colVec,d_val,nnz,points,pointsPerFile,pointCount,index);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
findMaxAbs<<<gridBlock, threadBlock>>>(nRxns,d_umat2,nMets,d_rowVec,d_colVec,d_val,nnz,points,pointsPerFile,pointCount,index);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}