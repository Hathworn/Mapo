#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "mapPrefixSumToPrisms_llm.cu"
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
    const unsigned numberOfPrisms = 1;
const unsigned raysPerSample = 1;
const unsigned reflectionSlices = 1;
const unsigned *raysPerPrism = NULL;
hipMalloc(&raysPerPrism, XSIZE*YSIZE);
const unsigned *prefixSum = NULL;
hipMalloc(&prefixSum, XSIZE*YSIZE);
unsigned *indicesOfPrisms = NULL;
hipMalloc(&indicesOfPrisms, XSIZE*YSIZE);
unsigned *numberOfReflections = NULL;
hipMalloc(&numberOfReflections, XSIZE*YSIZE);
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
mapPrefixSumToPrisms<<<gridBlock, threadBlock>>>(numberOfPrisms,raysPerSample,reflectionSlices,raysPerPrism,prefixSum,indicesOfPrisms,numberOfReflections);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
mapPrefixSumToPrisms<<<gridBlock, threadBlock>>>(numberOfPrisms,raysPerSample,reflectionSlices,raysPerPrism,prefixSum,indicesOfPrisms,numberOfReflections);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
mapPrefixSumToPrisms<<<gridBlock, threadBlock>>>(numberOfPrisms,raysPerSample,reflectionSlices,raysPerPrism,prefixSum,indicesOfPrisms,numberOfReflections);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}