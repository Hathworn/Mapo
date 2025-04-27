#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaSToOutput_kernel.cu"
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
    const unsigned int nbProposals = 1;
const unsigned int scoreIdx = 1;
const unsigned int nbCls = 1;
const unsigned int nbOutputs = 1;
const unsigned int maxParts = 1;
const unsigned int maxTemplates = 1;
bool generateParts = 1;
bool generateTemplates = 1;
const int *numPartsPerClass = NULL;
hipMalloc(&numPartsPerClass, XSIZE*YSIZE);
const int *numTemplatesPerClass = NULL;
hipMalloc(&numTemplatesPerClass, XSIZE*YSIZE);
const int *maxCls = NULL;
hipMalloc(&maxCls, XSIZE*YSIZE);
const float *ROIEst = NULL;
hipMalloc(&ROIEst, XSIZE*YSIZE);
const int *predictionIndex = NULL;
hipMalloc(&predictionIndex, XSIZE*YSIZE);
const float *partsPrediction = NULL;
hipMalloc(&partsPrediction, XSIZE*YSIZE);
const float *partsVisibilityPrediction = NULL;
hipMalloc(&partsVisibilityPrediction, XSIZE*YSIZE);
const float *templatesPrediction = NULL;
hipMalloc(&templatesPrediction, XSIZE*YSIZE);
float *outputs = NULL;
hipMalloc(&outputs, XSIZE*YSIZE);
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
cudaSToOutput_kernel<<<gridBlock, threadBlock>>>(nbProposals,scoreIdx,nbCls,nbOutputs,maxParts,maxTemplates,generateParts,generateTemplates,numPartsPerClass,numTemplatesPerClass,maxCls,ROIEst,predictionIndex,partsPrediction,partsVisibilityPrediction,templatesPrediction,outputs);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaSToOutput_kernel<<<gridBlock, threadBlock>>>(nbProposals,scoreIdx,nbCls,nbOutputs,maxParts,maxTemplates,generateParts,generateTemplates,numPartsPerClass,numTemplatesPerClass,maxCls,ROIEst,predictionIndex,partsPrediction,partsVisibilityPrediction,templatesPrediction,outputs);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaSToOutput_kernel<<<gridBlock, threadBlock>>>(nbProposals,scoreIdx,nbCls,nbOutputs,maxParts,maxTemplates,generateParts,generateTemplates,numPartsPerClass,numTemplatesPerClass,maxCls,ROIEst,predictionIndex,partsPrediction,partsVisibilityPrediction,templatesPrediction,outputs);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}