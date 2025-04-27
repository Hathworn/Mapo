#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM_BLOCKS 16
#define BLOCK_WIDTH 1

__global__ void hello()
{
    // Use shared memory to reduce redundant printf call
    __shared__ int block_id;
    if (threadIdx.x == 0) {
        block_id = blockIdx.x;
    }
    __syncthreads(); // Ensure all threads see the updated block_id

    printf("Hello world! I'm a thread in block %d\n", block_id);
}