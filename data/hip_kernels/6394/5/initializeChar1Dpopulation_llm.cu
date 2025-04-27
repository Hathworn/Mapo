#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float generateRandom(hiprandState* globalState) {
    // Using thread index to ensure unique seeds for each thread
    int ind = threadIdx.x;
    hiprandState localState = globalState[ind];
    float RANDOM = hiprand_uniform(&localState);
    globalState[ind] = localState;
    return RANDOM;
}

__device__ float generateRandomc(hiprandState* globalState) {
    // Using thread index to ensure unique seeds for each thread
    int ind = threadIdx.x;
    hiprandState localState = globalState[ind];
    float RANDOM = hiprand_uniform(&localState);
    globalState[ind] = localState;
    return RANDOM;
}

__global__ void initializeChar1Dpopulation(char *population, int sizeofPopulation, int sizeofChormosome, hiprandState* globalState, int division) {
    int populationIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (populationIndex < (sizeofPopulation * sizeofChormosome)) {
        // Directly generating random character without casting to int
        population[populationIndex] = (char)((generateRandomc(globalState) * 2) + 48);
    }
    // Removed __syncthreads() as it's not required based on current logic
}