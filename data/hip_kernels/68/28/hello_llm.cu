#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void hello() {
    int blockId = blockIdx.x; // Cache block index to reduce register usage
    printf("Hello world! I'm a thread in block %d\n", blockId);
}