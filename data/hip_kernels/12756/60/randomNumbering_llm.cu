#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int* degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if thread index is within bounds
    if (i < n) {
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;

        // Use integer arithmetic for precision
        int randomValue = (int)(RANDOM * limit);
        degreeCount[i] = randomValue + 1;
    }
}