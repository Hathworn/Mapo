#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(int* input, int* sumOut) {
    int blockOffset = blockIdx.x * blockDim.x;
    int globalIdx = blockOffset + threadIdx.x;

    for (int j = 0; j < 100 / (blockDim.x * gridDim.x); j++) {
        int idx = globalIdx + (j * blockDim.x * gridDim.x);
        if (idx < 100) {
            atomicAdd(sumOut, input[idx]);  // Consolidate index calculations
            printf("NUM:%d Thread: %d ||\n", input[idx], globalIdx);  // Simplify printf index
        }
    }
}