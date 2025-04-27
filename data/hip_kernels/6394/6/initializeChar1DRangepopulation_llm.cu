#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float generateRandom(hiprandState* globalState) {
    hiprandState localState = globalState[0];
    float RANDOM = hiprand_uniform(&localState);
    globalState[0] = localState;
    return RANDOM;
}

__device__ float generateRandomc(hiprandState* globalState) {
    hiprandState localState = globalState[0];
    float RANDOM = hiprand_uniform(&localState);
    globalState[0] = localState;
    return RANDOM;
}

__global__ void initializeChar1DRangepopulation(char *population, int sizeofPopulation, int sizeofChormosome, hiprandState* globalState, int division, char* range) {
    int populationIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread can process a population index
    if(populationIndex < (sizeofPopulation * sizeofChormosome)) {
        // Use shared memory for faster access if multiple threads use the same data
        __shared__ hiprandState sharedState;
        if (threadIdx.x == 0) {
            sharedState = globalState[0];
        }
        __syncthreads();

        // Generate random number and store result in local population array
        float randValue = hiprand_uniform(&sharedState);
        if (threadIdx.x == 0) {
            globalState[0] = sharedState;
        }
        __syncthreads();

        population[populationIndex] = range[(int)(randValue * sizeofChormosome)];
    }
}