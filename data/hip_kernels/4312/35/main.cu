#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "assembleBinBlockCSRKernel.cu"
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
    const unsigned matrix_size = 1;
const float *diagonal_blks = NULL;
hipMalloc(&diagonal_blks, XSIZE*YSIZE);
const float *nondiagonal_blks = NULL;
hipMalloc(&nondiagonal_blks, XSIZE*YSIZE);
const int *csr_rowptr = NULL;
hipMalloc(&csr_rowptr, XSIZE*YSIZE);
const unsigned *blkrow_offset = NULL;
hipMalloc(&blkrow_offset, XSIZE*YSIZE);
float *JtJ_data = NULL;
hipMalloc(&JtJ_data, XSIZE*YSIZE);
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
assembleBinBlockCSRKernel<<<gridBlock, threadBlock>>>(matrix_size,diagonal_blks,nondiagonal_blks,csr_rowptr,blkrow_offset,JtJ_data);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
assembleBinBlockCSRKernel<<<gridBlock, threadBlock>>>(matrix_size,diagonal_blks,nondiagonal_blks,csr_rowptr,blkrow_offset,JtJ_data);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
assembleBinBlockCSRKernel<<<gridBlock, threadBlock>>>(matrix_size,diagonal_blks,nondiagonal_blks,csr_rowptr,blkrow_offset,JtJ_data);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}