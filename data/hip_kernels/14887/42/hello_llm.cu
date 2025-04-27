#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using warp-synchronous printf
__global__ void hello()
{
    // Calculate the unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single thread to print the message for the block
    if (threadIdx.x == 0) {
        printf("Hello world! I'm a thread in block %d\n", blockIdx.x);
    }
}