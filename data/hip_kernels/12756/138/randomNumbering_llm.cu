```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (i >= n) return;

    hiprandState localState = globalState[i];
    float RANDOM = hiprand_uniform(&localState);
    globalState[i] = localState;

    // Optimize random number calculation by avoiding unnecessary operations
    RANDOM = RANDOM * (limit - 1) + 1;

    degreeCount[i] = (int)RANDOM;
}