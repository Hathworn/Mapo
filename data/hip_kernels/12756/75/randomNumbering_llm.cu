#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int* degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure we don't access memory out of bounds
    if (i < n) {  
        hiprandState localState = globalState[i];
        
        // Directly use the calculated random number
        float RANDOM = hiprand_uniform(&localState) * (limit - 1 + 0.999999) + 1;
        
        globalState[i] = localState;
        
        degreeCount[i] = (int)RANDOM;
    }
}