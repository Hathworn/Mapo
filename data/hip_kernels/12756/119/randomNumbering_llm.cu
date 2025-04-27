#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= n) return; // Boundary check for thread index

    hiprandState localState = globalState[i];
    float RANDOM = hiprand_uniform(&localState) * (limit - 1) + 1; // Combine operations

    degreeCount[i] = (int)RANDOM;
    globalState[i] = localState; // Move state update after calculation
}