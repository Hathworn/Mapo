#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "AddPackKernel_llm.cu"
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
    unsigned long int *codes = NULL;
hipMalloc(&codes, XSIZE*YSIZE);
int *measures = NULL;
hipMalloc(&measures, XSIZE*YSIZE);
int dimensionsCount = 1;
int *dimendionsSizes = NULL;
hipMalloc(&dimendionsSizes, XSIZE*YSIZE);
int measuresCount = 1;
int currentCapacity = 1;
int fullCapacity = 1;
int packCount = 1;
int *packDimensions = NULL;
hipMalloc(&packDimensions, XSIZE*YSIZE);
int *packMeasures = NULL;
hipMalloc(&packMeasures, XSIZE*YSIZE);
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
AddPackKernel<<<gridBlock, threadBlock>>>(codes,measures,dimensionsCount,dimendionsSizes,measuresCount,currentCapacity,fullCapacity,packCount,packDimensions,packMeasures);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
AddPackKernel<<<gridBlock, threadBlock>>>(codes,measures,dimensionsCount,dimendionsSizes,measuresCount,currentCapacity,fullCapacity,packCount,packDimensions,packMeasures);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
AddPackKernel<<<gridBlock, threadBlock>>>(codes,measures,dimensionsCount,dimendionsSizes,measuresCount,currentCapacity,fullCapacity,packCount,packDimensions,packMeasures);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}