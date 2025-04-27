#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) { // Ensure access is within bounds
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;

        RANDOM *= (limit - 1 + 0.999999);
        RANDOM += 1;

        degreeCount[i] = static_cast<int>(RANDOM); // Use C++ casting
    }
}