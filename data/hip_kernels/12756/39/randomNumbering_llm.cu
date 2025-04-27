#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (i < n) {
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;

        // Perform calculation directly without repeated operations
        degreeCount[i] = (int)(RANDOM * limit + 1);
    }
}