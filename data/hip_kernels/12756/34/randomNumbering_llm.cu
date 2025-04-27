```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void randomNumbering(hiprandState* globalState, int* degreeCount, int n, int limit) {

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure valid index range
    if (i < n) {
        // Use local state for random number generation
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        
        // Store updated state back to global memory
        globalState[i] = localState;
        
        // Calculate random number within specific range
        RANDOM = RANDOM * (limit - 1) + 1;
        
        // Store result in degreeCount array
        degreeCount[i] = static_cast<int>(RANDOM);
    }
}