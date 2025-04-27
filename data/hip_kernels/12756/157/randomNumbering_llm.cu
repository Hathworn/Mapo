#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int *degreeCount, int n, int limit) {
    // Use shared memory for block-level state and pre-calculate expressions
    extern __shared__ hiprandState sharedState[];
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        if (threadIdx.x == 0) {
            sharedState[blockDim.x] = globalState[blockIdx.x];
        }
        __syncthreads();

        hiprandState localState = sharedState[threadIdx.x];
        float RANDOM = hiprand_uniform(&localState);

        sharedState[threadIdx.x] = localState;
        globalState[i] = sharedState[threadIdx.x];

        float scale_factor = limit - 0.000001f;
        RANDOM = RANDOM * scale_factor + 1.0f; // Pre-calculate scale factor

        degreeCount[i] = (int)RANDOM;
    }
}