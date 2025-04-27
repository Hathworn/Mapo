#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "applyNormSum.cu"
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
    double *dMap = NULL;
hipMalloc(&dMap, XSIZE*YSIZE);
double *dSupFeature = NULL;
hipMalloc(&dSupFeature, XSIZE*YSIZE);
double *dMaxSupFeature = NULL;
hipMalloc(&dMaxSupFeature, XSIZE*YSIZE);
double *dMeanSupFeature = NULL;
hipMalloc(&dMeanSupFeature, XSIZE*YSIZE);
double *dInfFeature = NULL;
hipMalloc(&dInfFeature, XSIZE*YSIZE);
double *dMaxInfFeature = NULL;
hipMalloc(&dMaxInfFeature, XSIZE*YSIZE);
double *dMeanInfFeature = NULL;
hipMalloc(&dMeanInfFeature, XSIZE*YSIZE);
int dSize = XSIZE*YSIZE;
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
applyNormSum<<<gridBlock, threadBlock>>>(dMap,dSupFeature,dMaxSupFeature,dMeanSupFeature,dInfFeature,dMaxInfFeature,dMeanInfFeature,dSize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
applyNormSum<<<gridBlock, threadBlock>>>(dMap,dSupFeature,dMaxSupFeature,dMeanSupFeature,dInfFeature,dMaxInfFeature,dMeanInfFeature,dSize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
applyNormSum<<<gridBlock, threadBlock>>>(dMap,dSupFeature,dMaxSupFeature,dMeanSupFeature,dInfFeature,dMaxInfFeature,dMeanInfFeature,dSize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}