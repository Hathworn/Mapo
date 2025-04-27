#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu()
{
    // Use shared memory to reduce redundancy
    __shared__ int bid;
    __shared__ int tid;

    // Initialize shared memory once per block
    if (threadIdx.x == 0) {
        bid = blockIdx.x;
    }
    tid = threadIdx.x;

    __syncthreads(); // Ensure block sync before using shared variables

    printf("Hello World from block %d and thread %d!\n", bid, tid);
}