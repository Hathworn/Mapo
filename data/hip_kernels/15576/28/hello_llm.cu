#include "hip/hip_runtime.h"
#include "includes.h"

// Use __shared__ memory and support multiple blocks
__global__ void hello()
{
    // Get the global thread index
    int globalThreadIdx = blockIdx.x * blockDim.x + threadIdx.x;

    if(threadIdx.x == 0) // Ensure only one thread per block prints
    {
        printf("Hello world! I'm a thread in block %d\n", blockIdx.x);
    }

    // Optionally sync threads within the block
    __syncthreads();
}