#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeDotProducts.cu"
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
    float3 *pDotProducts = NULL;
hipMalloc(&pDotProducts, XSIZE*YSIZE);
size_t pSize = XSIZE*YSIZE;
int *pCandidates = NULL;
hipMalloc(&pCandidates, XSIZE*YSIZE);
size_t *pJumpLength = NULL;
hipMalloc(&pJumpLength, XSIZE*YSIZE);
size_t *pCandidateSize = NULL;
hipMalloc(&pCandidateSize, XSIZE*YSIZE);
size_t pNumberOfCandidates = 1;
int *pFeatureIdsNeighbor = NULL;
hipMalloc(&pFeatureIdsNeighbor, XSIZE*YSIZE);
float *pValuesNeighbor = NULL;
hipMalloc(&pValuesNeighbor, XSIZE*YSIZE);
size_t pMaxNnzNeighbor = 1;
size_t *pSizeNeighbor = NULL;
hipMalloc(&pSizeNeighbor, XSIZE*YSIZE);
int *pFeatureIdsInstance = NULL;
hipMalloc(&pFeatureIdsInstance, XSIZE*YSIZE);
float *pValuesInstance = NULL;
hipMalloc(&pValuesInstance, XSIZE*YSIZE);
size_t pMaxNnzInstance = 1;
size_t *pSizeInstance = NULL;
hipMalloc(&pSizeInstance, XSIZE*YSIZE);
float *pPreComputedDotProductsNeighbor = NULL;
hipMalloc(&pPreComputedDotProductsNeighbor, XSIZE*YSIZE);
float *pPreComputedDotProductsInstance = NULL;
hipMalloc(&pPreComputedDotProductsInstance, XSIZE*YSIZE);
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
computeDotProducts<<<gridBlock, threadBlock>>>(pDotProducts,pSize,pCandidates,pJumpLength,pCandidateSize,pNumberOfCandidates,pFeatureIdsNeighbor,pValuesNeighbor,pMaxNnzNeighbor,pSizeNeighbor,pFeatureIdsInstance,pValuesInstance,pMaxNnzInstance,pSizeInstance,pPreComputedDotProductsNeighbor,pPreComputedDotProductsInstance);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeDotProducts<<<gridBlock, threadBlock>>>(pDotProducts,pSize,pCandidates,pJumpLength,pCandidateSize,pNumberOfCandidates,pFeatureIdsNeighbor,pValuesNeighbor,pMaxNnzNeighbor,pSizeNeighbor,pFeatureIdsInstance,pValuesInstance,pMaxNnzInstance,pSizeInstance,pPreComputedDotProductsNeighbor,pPreComputedDotProductsInstance);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeDotProducts<<<gridBlock, threadBlock>>>(pDotProducts,pSize,pCandidates,pJumpLength,pCandidateSize,pNumberOfCandidates,pFeatureIdsNeighbor,pValuesNeighbor,pMaxNnzNeighbor,pSizeNeighbor,pFeatureIdsInstance,pValuesInstance,pMaxNnzInstance,pSizeInstance,pPreComputedDotProductsNeighbor,pPreComputedDotProductsInstance);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}