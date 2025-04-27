#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float generateRandom(hiprandState* globalState) {
    int ind = blockIdx.x * blockDim.x + threadIdx.x; // Ensure unique index for each thread
    hiprandState localState = globalState[ind];
    float RANDOM = hiprand_uniform(&localState);
    globalState[ind] = localState;
    return RANDOM;
}

__global__ void initializeBinary1Dpopulation(int *population, int sizeofPopulation, int sizeofChormosome, hiprandState* globalState, int division) {
    int populationIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (populationIndex < (sizeofPopulation * sizeofChormosome)) {
        population[populationIndex] = (int)(generateRandom(globalState) * 2);
        // No need for printf; it slows down execution
    }
}