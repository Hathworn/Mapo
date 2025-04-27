#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeNormsAndCenter.cu"
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
    float *norms = NULL;
hipMalloc(&norms, XSIZE*YSIZE);
float *center = NULL;
hipMalloc(&center, XSIZE*YSIZE);
float *masses = NULL;
hipMalloc(&masses, XSIZE*YSIZE);
float4 *positions = NULL;
hipMalloc(&positions, XSIZE*YSIZE);
int *blocknums = NULL;
hipMalloc(&blocknums, XSIZE*YSIZE);
int *blocksizes = NULL;
hipMalloc(&blocksizes, XSIZE*YSIZE);
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
computeNormsAndCenter<<<gridBlock, threadBlock>>>(norms,center,masses,positions,blocknums,blocksizes);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeNormsAndCenter<<<gridBlock, threadBlock>>>(norms,center,masses,positions,blocknums,blocksizes);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeNormsAndCenter<<<gridBlock, threadBlock>>>(norms,center,masses,positions,blocknums,blocksizes);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}