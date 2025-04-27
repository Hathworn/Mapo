#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Utilize shared memory to minimize global memory access
    __shared__ int blockId;
    // Load block index into shared memory
    if (threadIdx.x == 0) {
        blockId = blockIdx.x;
    }
    __syncthreads();
    // Print using shared memory variable
    printf("Hello world! I'm a thread in block %d\n", blockId);
}