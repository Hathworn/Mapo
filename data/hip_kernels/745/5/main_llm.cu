#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cuda_Shrink_CalU_Vector_llm.cu"
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
    float *Y = NULL;
hipMalloc(&Y, XSIZE*YSIZE);
float *U = NULL;
hipMalloc(&U, XSIZE*YSIZE);
float *X = NULL;
hipMalloc(&X, XSIZE*YSIZE);
float lambda = 1;
float *L1Weight = NULL;
hipMalloc(&L1Weight, XSIZE*YSIZE);
int nRows = 1;
int nCols = 1;
int nFilts = 1;
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
cuda_Shrink_CalU_Vector<<<gridBlock, threadBlock>>>(Y,U,X,lambda,L1Weight,nRows,nCols,nFilts);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cuda_Shrink_CalU_Vector<<<gridBlock, threadBlock>>>(Y,U,X,lambda,L1Weight,nRows,nCols,nFilts);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cuda_Shrink_CalU_Vector<<<gridBlock, threadBlock>>>(Y,U,X,lambda,L1Weight,nRows,nCols,nFilts);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}