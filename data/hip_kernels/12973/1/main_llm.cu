#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "elementMulMatrixKernel_llm.cu"
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
    double *dev_w = NULL;
hipMalloc(&dev_w, XSIZE*YSIZE);
const double *dev_U = NULL;
hipMalloc(&dev_U, XSIZE*YSIZE);
const double *dev_V = NULL;
hipMalloc(&dev_V, XSIZE*YSIZE);
unsigned int index_row_i = 1;
unsigned int index_column_j = 1;
unsigned int dim1_U = 1;
unsigned int dim1_V = 1;
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
elementMulMatrixKernel<<<gridBlock, threadBlock>>>(dev_w,dev_U,dev_V,index_row_i,index_column_j,dim1_U,dim1_V);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
elementMulMatrixKernel<<<gridBlock, threadBlock>>>(dev_w,dev_U,dev_V,index_row_i,index_column_j,dim1_U,dim1_V);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
elementMulMatrixKernel<<<gridBlock, threadBlock>>>(dev_w,dev_U,dev_V,index_row_i,index_column_j,dim1_U,dim1_V);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}