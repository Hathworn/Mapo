#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit){

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if i is within bounds
    if (i < n) {
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;

        RANDOM *= limit; // More efficient scaling operation
        RANDOM += 1.0f;

        degreeCount[i] = (int) RANDOM;
    }
}