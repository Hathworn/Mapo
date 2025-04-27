#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wipe(int *buffer, int length) {
    // Calculate global thread index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use stride loop for parallel execution
    for (int i = globalIdx; i < length; i += stride) {
        buffer[i] = -1;
    }
}