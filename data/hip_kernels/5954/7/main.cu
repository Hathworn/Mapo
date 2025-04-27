#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "LinearPolynomProbsImpl.cu"
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
    const float *features = NULL;
hipMalloc(&features, XSIZE*YSIZE);
int batchSize = XSIZE*YSIZE;
const int *splits = NULL;
hipMalloc(&splits, XSIZE*YSIZE);
const float *conditions = NULL;
hipMalloc(&conditions, XSIZE*YSIZE);
const int *polynomOffsets = NULL;
hipMalloc(&polynomOffsets, XSIZE*YSIZE);
int polynomCount = 1;
float lambda = 1;
float *probs = NULL;
hipMalloc(&probs, XSIZE*YSIZE);
const int *origFIds = NULL;
hipMalloc(&origFIds, XSIZE*YSIZE);
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
LinearPolynomProbsImpl<<<gridBlock, threadBlock>>>(features,batchSize,splits,conditions,polynomOffsets,polynomCount,lambda,probs,origFIds);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
LinearPolynomProbsImpl<<<gridBlock, threadBlock>>>(features,batchSize,splits,conditions,polynomOffsets,polynomCount,lambda,probs,origFIds);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
LinearPolynomProbsImpl<<<gridBlock, threadBlock>>>(features,batchSize,splits,conditions,polynomOffsets,polynomCount,lambda,probs,origFIds);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}