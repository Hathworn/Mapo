#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaSNormalizeROIs_kernel.cu"
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
    unsigned int inputSizeX = 1;
unsigned int inputSizeY = 1;
unsigned int nbProposals = 1;
unsigned int batchSize = 1;
unsigned int scoreIdx = 1;
unsigned int nbCls = 1;
unsigned int maxParts = 1;
unsigned int maxTemplates = 1;
bool keepMax = 1;
bool generateParts = 1;
bool generateTemplates = 1;
const float normX = 1;
const float normY = 1;
const float *means = NULL;
hipMalloc(&means, XSIZE*YSIZE);
const float *std = NULL;
hipMalloc(&std, XSIZE*YSIZE);
const unsigned int *numPartsPerClass = NULL;
hipMalloc(&numPartsPerClass, XSIZE*YSIZE);
const unsigned int *numTemplatesPerClass = NULL;
hipMalloc(&numTemplatesPerClass, XSIZE*YSIZE);
const float *ROIRef = NULL;
hipMalloc(&ROIRef, XSIZE*YSIZE);
const float *ROIEst = NULL;
hipMalloc(&ROIEst, XSIZE*YSIZE);
const float *ValuesEst = NULL;
hipMalloc(&ValuesEst, XSIZE*YSIZE);
const float *partsEst = NULL;
hipMalloc(&partsEst, XSIZE*YSIZE);
const float *partsVisibilityEst = NULL;
hipMalloc(&partsVisibilityEst, XSIZE*YSIZE);
const float *templatesEst = NULL;
hipMalloc(&templatesEst, XSIZE*YSIZE);
float *outputs = NULL;
hipMalloc(&outputs, XSIZE*YSIZE);
int *argMax = NULL;
hipMalloc(&argMax, XSIZE*YSIZE);
float *partsPrediction = NULL;
hipMalloc(&partsPrediction, XSIZE*YSIZE);
float *partsVisibilityPrediction = NULL;
hipMalloc(&partsVisibilityPrediction, XSIZE*YSIZE);
float *templatesPrediction = NULL;
hipMalloc(&templatesPrediction, XSIZE*YSIZE);
float scoreThreshold = 1;
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
cudaSNormalizeROIs_kernel<<<gridBlock, threadBlock>>>(inputSizeX,inputSizeY,nbProposals,batchSize,scoreIdx,nbCls,maxParts,maxTemplates,keepMax,generateParts,generateTemplates,normX,normY,means,std,numPartsPerClass,numTemplatesPerClass,ROIRef,ROIEst,ValuesEst,partsEst,partsVisibilityEst,templatesEst,outputs,argMax,partsPrediction,partsVisibilityPrediction,templatesPrediction,scoreThreshold);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaSNormalizeROIs_kernel<<<gridBlock, threadBlock>>>(inputSizeX,inputSizeY,nbProposals,batchSize,scoreIdx,nbCls,maxParts,maxTemplates,keepMax,generateParts,generateTemplates,normX,normY,means,std,numPartsPerClass,numTemplatesPerClass,ROIRef,ROIEst,ValuesEst,partsEst,partsVisibilityEst,templatesEst,outputs,argMax,partsPrediction,partsVisibilityPrediction,templatesPrediction,scoreThreshold);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaSNormalizeROIs_kernel<<<gridBlock, threadBlock>>>(inputSizeX,inputSizeY,nbProposals,batchSize,scoreIdx,nbCls,maxParts,maxTemplates,keepMax,generateParts,generateTemplates,normX,normY,means,std,numPartsPerClass,numTemplatesPerClass,ROIRef,ROIEst,ValuesEst,partsEst,partsVisibilityEst,templatesEst,outputs,argMax,partsPrediction,partsVisibilityPrediction,templatesPrediction,scoreThreshold);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}