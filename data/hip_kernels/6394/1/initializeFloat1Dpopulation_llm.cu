#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

float *valuesf;
float *weightf;
float maxWf;

float *matchf;
const int fSUMFLAG=0;
const int fKNAPSACKFLAG = 1;

const int fAVGFLAG=2;
const int fMATCHFLAG=3;
const int fINVERSESUMFLAG=4;

const int fMAXIMIZE=-1;
const int fMINIMIZE=1;

__device__ float generateRandom(hiprandState* globalState) {
    hiprandState localState = globalState[0];
    float RANDOM = hiprand_uniform(&localState);
    globalState[0] = localState;
    return RANDOM;
}

__device__ float generateRandomf(hiprandState* globalState) {
    hiprandState localState = globalState[0];
    float RANDOM = hiprand_uniform(&localState);
    globalState[0] = localState;
    return RANDOM;
}

__global__ void initializeFloat1Dpopulation(float *population, int sizeofPopulation, int sizeofChormosome, hiprandState* globalState, int division) {
    int populationIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (populationIndex < (sizeofPopulation * sizeofChormosome)) {
        // Generate binary value in a more concise way
        population[populationIndex] = generateRandomf(globalState) < 0.5f ? 0 : 1;
    }
    // __syncthreads() is not needed when each thread operates on independent memory
}