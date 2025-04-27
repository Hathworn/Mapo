#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to reduce the number of printf calls
__global__ void hello()
{
    // Load block ID into shared memory
    __shared__ int shared_block_id;
    if (threadIdx.x == 0)
    {
        shared_block_id = blockIdx.x;
    }
    __syncthreads();
    
    // Only print from one thread per block to reduce console output overhead
    if (threadIdx.x == 0)
    {
        printf("Hello world! I'm a thread in block %d\n", shared_block_id);
    }
}