#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) { // Ensure i is within bounds
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;

        RANDOM = RANDOM * (limit - 0.000001f) + 1; // Simplify calculation
        degreeCount[i] = (int)RANDOM;
    }
}