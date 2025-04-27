#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "FullyConnectedEstimateLearningRateKernel.cu"
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
    float *weightLearningRatePtr = NULL;
hipMalloc(&weightLearningRatePtr, XSIZE*YSIZE);
float *biasLearningRatePtr = NULL;
hipMalloc(&biasLearningRatePtr, XSIZE*YSIZE);
float *avgWeightGradPtr = NULL;
hipMalloc(&avgWeightGradPtr, XSIZE*YSIZE);
float *avgBiasGradPtr = NULL;
hipMalloc(&avgBiasGradPtr, XSIZE*YSIZE);
float *avgWeightGradVarPtr = NULL;
hipMalloc(&avgWeightGradVarPtr, XSIZE*YSIZE);
float *avgBiasGradVarPtr = NULL;
hipMalloc(&avgBiasGradVarPtr, XSIZE*YSIZE);
float *avgWeightGradCurvePtr = NULL;
hipMalloc(&avgWeightGradCurvePtr, XSIZE*YSIZE);
float *avgBiasGradCurvePtr = NULL;
hipMalloc(&avgBiasGradCurvePtr, XSIZE*YSIZE);
float *avgWeightGradCurveVarPtr = NULL;
hipMalloc(&avgWeightGradCurveVarPtr, XSIZE*YSIZE);
float *avgBiasGradCurveVarPtr = NULL;
hipMalloc(&avgBiasGradCurveVarPtr, XSIZE*YSIZE);
float *dropoutMaskPtr = NULL;
hipMalloc(&dropoutMaskPtr, XSIZE*YSIZE);
int prevLayerSize = XSIZE*YSIZE;
int thisLayerSize = XSIZE*YSIZE;
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
FullyConnectedEstimateLearningRateKernel<<<gridBlock, threadBlock>>>(weightLearningRatePtr,biasLearningRatePtr,avgWeightGradPtr,avgBiasGradPtr,avgWeightGradVarPtr,avgBiasGradVarPtr,avgWeightGradCurvePtr,avgBiasGradCurvePtr,avgWeightGradCurveVarPtr,avgBiasGradCurveVarPtr,dropoutMaskPtr,prevLayerSize,thisLayerSize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
FullyConnectedEstimateLearningRateKernel<<<gridBlock, threadBlock>>>(weightLearningRatePtr,biasLearningRatePtr,avgWeightGradPtr,avgBiasGradPtr,avgWeightGradVarPtr,avgBiasGradVarPtr,avgWeightGradCurvePtr,avgBiasGradCurvePtr,avgWeightGradCurveVarPtr,avgBiasGradCurveVarPtr,dropoutMaskPtr,prevLayerSize,thisLayerSize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
FullyConnectedEstimateLearningRateKernel<<<gridBlock, threadBlock>>>(weightLearningRatePtr,biasLearningRatePtr,avgWeightGradPtr,avgBiasGradPtr,avgWeightGradVarPtr,avgBiasGradVarPtr,avgWeightGradCurvePtr,avgBiasGradCurvePtr,avgWeightGradCurveVarPtr,avgBiasGradCurveVarPtr,dropoutMaskPtr,prevLayerSize,thisLayerSize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}