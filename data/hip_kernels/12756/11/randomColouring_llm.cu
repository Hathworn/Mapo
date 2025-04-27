#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for better memory and performance
__global__ void randomColouring(hiprandState* globalState, int* degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (i < n) { // Ensure valid thread index
        // Use localState to avoid repeated global memory accesses
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);

        RANDOM = RANDOM * (limit - 0.000001f) + 1.0f; // Adjust random range calculation

        degreeCount[i] = static_cast<int>(RANDOM);

        globalState[i] = localState; // Update global state with modified local state
    }
}