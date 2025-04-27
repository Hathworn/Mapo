#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int *degreeCount, int n, int limit) {

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread index doesn't exceed number of elements
    if (i < n) {
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;

        // Precompute constant factor outside loop
        float factor = limit - 1 + 0.999999;
        
        RANDOM *= factor;
        RANDOM += 1;

        degreeCount[i] = (int) RANDOM;
    }
}