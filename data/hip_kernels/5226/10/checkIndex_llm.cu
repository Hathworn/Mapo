#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void checkIndex(void) {
    // Using a single call to retrieve block/thread and grid dimensions
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    printf("Thread ID: %d -- threadIdx:(%d, %d, %d) blockIdx:(%d, %d, %d) blockDim:(%d, %d, %d) gridDim:(%d, %d, %d)\n", 
           tid,
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z, blockDim.x, blockDim.y, blockDim.z,
           gridDim.x, gridDim.y, gridDim.z);
}