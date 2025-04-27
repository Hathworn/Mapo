#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpuPMCC_llm.cu"
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
    const float *vectsa = NULL;
hipMalloc(&vectsa, XSIZE*YSIZE);
size_t na = 1;
const float *vectsb = NULL;
hipMalloc(&vectsb, XSIZE*YSIZE);
size_t nb = 1;
size_t dim = 2;
const float *numPairs = NULL;
hipMalloc(&numPairs, XSIZE*YSIZE);
const float *means = NULL;
hipMalloc(&means, XSIZE*YSIZE);
const float *sds = NULL;
hipMalloc(&sds, XSIZE*YSIZE);
float *correlations = NULL;
hipMalloc(&correlations, XSIZE*YSIZE);
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
gpuPMCC<<<gridBlock, threadBlock>>>(vectsa,na,vectsb,nb,dim,numPairs,means,sds,correlations);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpuPMCC<<<gridBlock, threadBlock>>>(vectsa,na,vectsb,nb,dim,numPairs,means,sds,correlations);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpuPMCC<<<gridBlock, threadBlock>>>(vectsa,na,vectsb,nb,dim,numPairs,means,sds,correlations);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}