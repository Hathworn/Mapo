#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "testKernel.cu"
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
    float *d_matrixA = NULL;
hipMalloc(&d_matrixA, XSIZE*YSIZE);
float *d_matrixB = NULL;
hipMalloc(&d_matrixB, XSIZE*YSIZE);
float *d_matrixC = NULL;
hipMalloc(&d_matrixC, XSIZE*YSIZE);
const unsigned int ah = 1;
const unsigned int aw = 1;
const unsigned int bh = 1;
const unsigned int bw = 1;
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
testKernel<<<gridBlock, threadBlock>>>(d_matrixA,d_matrixB,d_matrixC,ah,aw,bh,bw);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
testKernel<<<gridBlock, threadBlock>>>(d_matrixA,d_matrixB,d_matrixC,ah,aw,bh,bw);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
testKernel<<<gridBlock, threadBlock>>>(d_matrixA,d_matrixB,d_matrixC,ah,aw,bh,bw);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}