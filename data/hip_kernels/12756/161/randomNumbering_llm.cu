#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) { // Ensure we don't access out of bounds
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        RANDOM = RANDOM * limit + 1; // Removed unnecessary operations
        degreeCount[i] = (int)RANDOM;
        globalState[i] = localState; // Update state after computation
    }
}