#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkIndex(void) {
    // Compute unique thread index based on block and thread indices
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    int blockId = blockIdx.y * gridDim.x + blockIdx.x;
    
    // Optimize printf by minimizing the number of parameters
    printf("Thread ID: %d || Block ID: %d\n", threadId, blockId);
}