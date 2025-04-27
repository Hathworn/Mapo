#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello() {
    // Precompute block index and thread index in registers for faster access
    unsigned int blockIndex = blockIdx.x;
    unsigned int threadIndex = threadIdx.x;

    // Minimize printf calls for performance boost
    printf("Hello from block: %u, thread: %u\n", blockIndex, threadIndex);
}