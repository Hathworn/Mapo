#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) { // Bounds check
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;

        // Reduce number of operations in transformation
        RANDOM = RANDOM * limit + (1.0f - RANDOM);

        degreeCount[i] = (int) RANDOM;
    }
}