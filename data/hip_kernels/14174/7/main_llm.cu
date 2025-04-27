#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "composeSingleSystem_llm.cu"
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
    const size_t offset = XSIZE*YSIZE;
const float *H = NULL;
hipMalloc(&H, XSIZE*YSIZE);
const size_t lowresWidth = XSIZE*YSIZE;
const size_t lowresHeight = XSIZE*YSIZE;
const size_t highresWidth = XSIZE*YSIZE;
const size_t highresHeight = XSIZE*YSIZE;
const float psfWidth = 1;
const int pixelRadius = 1;
float *systemMatrixVals = NULL;
hipMalloc(&systemMatrixVals, XSIZE*YSIZE);
int *systemMatrixCols = NULL;
hipMalloc(&systemMatrixCols, XSIZE*YSIZE);
int *systemMatrixRows = NULL;
hipMalloc(&systemMatrixRows, XSIZE*YSIZE);
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
composeSingleSystem<<<gridBlock, threadBlock>>>(offset,H,lowresWidth,lowresHeight,highresWidth,highresHeight,psfWidth,pixelRadius,systemMatrixVals,systemMatrixCols,systemMatrixRows);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
composeSingleSystem<<<gridBlock, threadBlock>>>(offset,H,lowresWidth,lowresHeight,highresWidth,highresHeight,psfWidth,pixelRadius,systemMatrixVals,systemMatrixCols,systemMatrixRows);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
composeSingleSystem<<<gridBlock, threadBlock>>>(offset,H,lowresWidth,lowresHeight,highresWidth,highresHeight,psfWidth,pixelRadius,systemMatrixVals,systemMatrixCols,systemMatrixRows);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}