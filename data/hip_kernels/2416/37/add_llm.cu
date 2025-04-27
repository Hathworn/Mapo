#include "hip/hip_runtime.h"
#include "includes.h"

// Use kernel parameters for block and grid indexing
__global__ void add(int *a, int *b, int *sum)
{
    // Calculate unique index for each thread
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Perform addition if index is zero (single-threaded equivalent)
    if (idx == 0) {
        // Utilize shared memory to optimize global memory access
        __shared__ int tempSum;
        tempSum = *a + *b;
        __syncthreads(); // Ensure completion of all ops
        *sum = tempSum;
    }
}