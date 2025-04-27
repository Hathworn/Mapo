#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void componentStepFive(unsigned int *Q, unsigned int length, unsigned int *sprimtemp, unsigned int s) {
    unsigned int tid = blockIdx.y * gridDim.x * blockDim.x * blockDim.y
                     + blockIdx.x * blockDim.x * blockDim.y 
                     + threadIdx.y * blockDim.x 
                     + threadIdx.x;

    // Check if tid is within bounds once, and combine checks
    if (tid < length && Q[tid] == s) {
        // Use atomic operation to prevent race conditions
        atomicExch(sprimtemp, 1);
    }
}