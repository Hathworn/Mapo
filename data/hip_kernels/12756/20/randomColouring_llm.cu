#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomColouring(hiprandState* globalState, int* degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (i < n) {  // Ensure index i is within bounds
        // Use shared memory to avoid redundant global memory access
        __shared__ hiprandState localState;
        localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        
        RANDOM = RANDOM * limit + 1; // Calculate directly in one line
        degreeCount[i] = (int)RANDOM;
        
        globalState[i] = localState; // Save state back to global
    }
}