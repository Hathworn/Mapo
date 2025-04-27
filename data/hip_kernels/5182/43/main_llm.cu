#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "LSTMDeltaKernelBPTT_llm.cu"
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
    float *deltas = NULL;
hipMalloc(&deltas, XSIZE*YSIZE);
float *cellStates = NULL;
hipMalloc(&cellStates, XSIZE*YSIZE);
float *previousCellStates = NULL;
hipMalloc(&previousCellStates, XSIZE*YSIZE);
float *cellStateErrors = NULL;
hipMalloc(&cellStateErrors, XSIZE*YSIZE);
float *nextCellStateErrors = NULL;
hipMalloc(&nextCellStateErrors, XSIZE*YSIZE);
float *outputGateDeltas = NULL;
hipMalloc(&outputGateDeltas, XSIZE*YSIZE);
float *forgetGateDeltas = NULL;
hipMalloc(&forgetGateDeltas, XSIZE*YSIZE);
float *nextForgetGateDeltas = NULL;
hipMalloc(&nextForgetGateDeltas, XSIZE*YSIZE);
float *inputGateDeltas = NULL;
hipMalloc(&inputGateDeltas, XSIZE*YSIZE);
float *nextInputGateDeltas = NULL;
hipMalloc(&nextInputGateDeltas, XSIZE*YSIZE);
float *cellInputDeltas = NULL;
hipMalloc(&cellInputDeltas, XSIZE*YSIZE);
float *cellInputActivations = NULL;
hipMalloc(&cellInputActivations, XSIZE*YSIZE);
float *cellStateActivations = NULL;
hipMalloc(&cellStateActivations, XSIZE*YSIZE);
float *outputGateActivations = NULL;
hipMalloc(&outputGateActivations, XSIZE*YSIZE);
float *nextForgetGateActivations = NULL;
hipMalloc(&nextForgetGateActivations, XSIZE*YSIZE);
float *inputGateActivations = NULL;
hipMalloc(&inputGateActivations, XSIZE*YSIZE);
float *cellInputActivationDerivatives = NULL;
hipMalloc(&cellInputActivationDerivatives, XSIZE*YSIZE);
float *cellStateActivationDerivatives = NULL;
hipMalloc(&cellStateActivationDerivatives, XSIZE*YSIZE);
float *outputGateActivationDerivatives = NULL;
hipMalloc(&outputGateActivationDerivatives, XSIZE*YSIZE);
float *forgetGateActivationDerivatives = NULL;
hipMalloc(&forgetGateActivationDerivatives, XSIZE*YSIZE);
float *inputGateActivationDerivatives = NULL;
hipMalloc(&inputGateActivationDerivatives, XSIZE*YSIZE);
float *cellInputWeights = NULL;
hipMalloc(&cellInputWeights, XSIZE*YSIZE);
float *outputGateWeights = NULL;
hipMalloc(&outputGateWeights, XSIZE*YSIZE);
float *forgetGateWeights = NULL;
hipMalloc(&forgetGateWeights, XSIZE*YSIZE);
float *inputGateWeights = NULL;
hipMalloc(&inputGateWeights, XSIZE*YSIZE);
int inputCount = 1;
int cellCount = 1;
int cellsPerBlock = 1;
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
LSTMDeltaKernelBPTT<<<gridBlock, threadBlock>>>(deltas,cellStates,previousCellStates,cellStateErrors,nextCellStateErrors,outputGateDeltas,forgetGateDeltas,nextForgetGateDeltas,inputGateDeltas,nextInputGateDeltas,cellInputDeltas,cellInputActivations,cellStateActivations,outputGateActivations,nextForgetGateActivations,inputGateActivations,cellInputActivationDerivatives,cellStateActivationDerivatives,outputGateActivationDerivatives,forgetGateActivationDerivatives,inputGateActivationDerivatives,cellInputWeights,outputGateWeights,forgetGateWeights,inputGateWeights,inputCount,cellCount,cellsPerBlock);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
LSTMDeltaKernelBPTT<<<gridBlock, threadBlock>>>(deltas,cellStates,previousCellStates,cellStateErrors,nextCellStateErrors,outputGateDeltas,forgetGateDeltas,nextForgetGateDeltas,inputGateDeltas,nextInputGateDeltas,cellInputDeltas,cellInputActivations,cellStateActivations,outputGateActivations,nextForgetGateActivations,inputGateActivations,cellInputActivationDerivatives,cellStateActivationDerivatives,outputGateActivationDerivatives,forgetGateActivationDerivatives,inputGateActivationDerivatives,cellInputWeights,outputGateWeights,forgetGateWeights,inputGateWeights,inputCount,cellCount,cellsPerBlock);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
LSTMDeltaKernelBPTT<<<gridBlock, threadBlock>>>(deltas,cellStates,previousCellStates,cellStateErrors,nextCellStateErrors,outputGateDeltas,forgetGateDeltas,nextForgetGateDeltas,inputGateDeltas,nextInputGateDeltas,cellInputDeltas,cellInputActivations,cellStateActivations,outputGateActivations,nextForgetGateActivations,inputGateActivations,cellInputActivationDerivatives,cellStateActivationDerivatives,outputGateActivationDerivatives,forgetGateActivationDerivatives,inputGateActivationDerivatives,cellInputWeights,outputGateWeights,forgetGateWeights,inputGateWeights,inputCount,cellCount,cellsPerBlock);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}