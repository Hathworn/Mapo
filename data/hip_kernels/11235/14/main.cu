#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Softmax_Rowwise_M.cu"
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
    const float *a = NULL;
hipMalloc(&a, XSIZE*YSIZE);
float *maxPerRow = NULL;
hipMalloc(&maxPerRow, XSIZE*YSIZE);
float *maxPerRowIndices = NULL;
hipMalloc(&maxPerRowIndices, XSIZE*YSIZE);
float *sumPerRow = NULL;
hipMalloc(&sumPerRow, XSIZE*YSIZE);
const int rows = 1;
const int cols = 1;
const int cols2 = 1;
float *out = NULL;
hipMalloc(&out, XSIZE*YSIZE);
const int n = 1;
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
Softmax_Rowwise_M<<<gridBlock, threadBlock>>>(a,maxPerRow,maxPerRowIndices,sumPerRow,rows,cols,cols2,out,n);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Softmax_Rowwise_M<<<gridBlock, threadBlock>>>(a,maxPerRow,maxPerRowIndices,sumPerRow,rows,cols,cols2,out,n);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Softmax_Rowwise_M<<<gridBlock, threadBlock>>>(a,maxPerRow,maxPerRowIndices,sumPerRow,rows,cols,cols2,out,n);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}