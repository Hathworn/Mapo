#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "GaussianEliminationGlobal_llm.cu"
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
    const int clusterSize = 1;
float *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
const float *diagonal_values = NULL;
hipMalloc(&diagonal_values, XSIZE*YSIZE);
const float *non_diagonal_values = NULL;
hipMalloc(&non_diagonal_values, XSIZE*YSIZE);
float *y = NULL;
hipMalloc(&y, XSIZE*YSIZE);
const int size = 1;
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
GaussianEliminationGlobal<<<gridBlock, threadBlock>>>(clusterSize,x,diagonal_values,non_diagonal_values,y,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
GaussianEliminationGlobal<<<gridBlock, threadBlock>>>(clusterSize,x,diagonal_values,non_diagonal_values,y,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
GaussianEliminationGlobal<<<gridBlock, threadBlock>>>(clusterSize,x,diagonal_values,non_diagonal_values,y,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}