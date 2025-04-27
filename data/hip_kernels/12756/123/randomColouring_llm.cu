#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomColouring (hiprandState* globalState, int *degreeCount, int n, int limit){

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= n) return;  // Ensure thread index is within bounds

    // Load the state for the current thread
    hiprandState localState = globalState[i];
    
    // Generate random number and compute degree count
    float RANDOM = hiprand_uniform(&localState) * (limit - 0.000001f) + 1.0f;
    
    // Store the updated state back to global memory
    globalState[i] = localState;
    
    // Assign the computed degree to the degreeCount array
    degreeCount[i] = static_cast<int>(RANDOM);
}