#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stencil_1d(int *in, int *out)
{
    // __shared__ keyword to declare variables in shared block memory
    __shared__ int temp[BLOCK_SIZE + 2 * RADIUS];
    int gindex = threadIdx.x + (blockIdx.x * blockDim.x) + RADIUS;
    int lindex = threadIdx.x + RADIUS;

    // Load main elements and halo in single statement for memory coalescing
    temp[lindex] = in[gindex];
    if (threadIdx.x < RADIUS)
    {
        temp[lindex - RADIUS] = in[gindex - RADIUS];
        temp[lindex + BLOCK_SIZE] = in[gindex + BLOCK_SIZE];
    }

    __syncthreads();

    // Unroll the loop for performance
    int result = 0;
    result += temp[lindex - 1];
    result += temp[lindex];
    result += temp[lindex + 1];

    // Store the result
    out[gindex-RADIUS] = result;
}