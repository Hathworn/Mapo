#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= n) return; // Ensure i is within bounds

    hiprandState localState = globalState[i];
    float RANDOM = hiprand_uniform(&localState);

    RANDOM = RANDOM * (limit - 1) + 1.0f; // Optimize calculation

    degreeCount[i] = __float2int_rn(RANDOM); // More accurate float to int conversion
    globalState[i] = localState;
}