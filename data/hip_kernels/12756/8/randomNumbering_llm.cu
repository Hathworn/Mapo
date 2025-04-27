#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit) {
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (i < n) { 
        // Use local state for random number generation
        hiprandState localState = globalState[i];
        
        // Generate uniform random number
        float RANDOM = hiprand_uniform(&localState);
        
        // Store updated state back
        globalState[i] = localState;
        
        // Calculate randomized degree
        RANDOM = RANDOM * limit + 1;
        
        // Store result in degree count array
        degreeCount[i] = (int)RANDOM;
    }
}