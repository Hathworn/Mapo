#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "makeBlockHessian.cu"
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
    float *h = NULL;
hipMalloc(&h, XSIZE*YSIZE);
float *forces1 = NULL;
hipMalloc(&forces1, XSIZE*YSIZE);
float *forces2 = NULL;
hipMalloc(&forces2, XSIZE*YSIZE);
float *mass = NULL;
hipMalloc(&mass, XSIZE*YSIZE);
float blockDelta = 1;
int *blocks = NULL;
hipMalloc(&blocks, XSIZE*YSIZE);
int *blocksizes = NULL;
hipMalloc(&blocksizes, XSIZE*YSIZE);
int numblocks = 1;
int *hessiannums = NULL;
hipMalloc(&hessiannums, XSIZE*YSIZE);
int *hessiansizes = NULL;
hipMalloc(&hessiansizes, XSIZE*YSIZE);
int setnum = 1;
int N = XSIZE*YSIZE;
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
makeBlockHessian<<<gridBlock, threadBlock>>>(h,forces1,forces2,mass,blockDelta,blocks,blocksizes,numblocks,hessiannums,hessiansizes,setnum,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
makeBlockHessian<<<gridBlock, threadBlock>>>(h,forces1,forces2,mass,blockDelta,blocks,blocksizes,numblocks,hessiannums,hessiansizes,setnum,N);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
makeBlockHessian<<<gridBlock, threadBlock>>>(h,forces1,forces2,mass,blockDelta,blocks,blocksizes,numblocks,hessiannums,hessiansizes,setnum,N);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}