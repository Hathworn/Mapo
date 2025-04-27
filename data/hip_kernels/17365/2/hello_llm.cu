#include "hip/hip_runtime.h"
#include "includes.h"

// Utilizing shared memory to reduce redundancy
__global__ void hello()
{
    // Cache block index in shared memory for faster access
    __shared__ int cachedBlockIdx;
    if (threadIdx.x == 0) {
        cachedBlockIdx = blockIdx.x; // Assign block index to shared memory
    }
    __syncthreads(); // Ensure all threads see the updated block index

    printf("Hello world! I'm a thread in block %d\n", cachedBlockIdx);
}