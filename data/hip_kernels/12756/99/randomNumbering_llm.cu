#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomNumbering(hiprandState* globalState, int* degreeCount, int n, int limit) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) { // Bounds check to prevent accessing invalid memory
        hiprandState localState = globalState[i]; // Load state
        float RANDOM = hiprand_uniform(&localState);
        RANDOM = RANDOM * limit + (1 - RANDOM); // Combine limit and addition
        degreeCount[i] = (int)RANDOM;

        globalState[i] = localState; // Store state
    }
}