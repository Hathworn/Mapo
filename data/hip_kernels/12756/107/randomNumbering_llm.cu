#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Only proceed if i is within bounds to avoid out-of-bounds memory access
    if (i < n) {
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState; // Update the global state with the local state

        RANDOM *= (limit - 1) + 0.999999f;
        RANDOM += 1.0f;

        degreeCount[i] = static_cast<int>(RANDOM);
    }
}