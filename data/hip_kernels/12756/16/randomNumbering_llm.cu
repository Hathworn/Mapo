#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering (hiprandState* globalState, int *degreeCount, int n, int limit){

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {  // Ensure within bounds (grid-stride loop can be added for more efficiency)
        hiprandState localState = globalState[i];
        float RANDOM = hiprand_uniform(&localState);
        
        // Scale and shift the random number
        RANDOM = RANDOM * limit + 1.0f;

        degreeCount[i] = (int) RANDOM;
        
        globalState[i] = localState; // Ensure updated state is stored
    }
}