#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel function
__global__ void randomNumbering(hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {  // Ensure thread index is within bounds
        hiprandState localState = globalState[i];
        float randomValue = hiprand_uniform(&localState);
        globalState[i] = localState;

        randomValue *= (limit - 1 + 0.999999);
        randomValue += 1;

        degreeCount[i] = static_cast<int>(randomValue); // Use static_cast for type conversion
    }
}