#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Load block index into shared memory for reduced redundancy
    __shared__ int blockIndex;
    
    if (threadIdx.x == 0) {
        blockIndex = blockIdx.x;
    }
    __syncthreads(); // Ensure shared memory is loaded before print

    printf("Hello world! I'm a thread in block %d\n", blockIndex);
}