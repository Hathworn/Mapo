#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (i < n) { // Ensure index is within bounds
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        globalState[i] = localState;  // Save local state back to global
        
        // Optimize random number scaling
        RANDOM = RANDOM * limit + 1;
        
        degreeCount[i] = (int) RANDOM;
    }
}