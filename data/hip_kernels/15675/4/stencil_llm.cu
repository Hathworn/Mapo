#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil(int *in, int *out)
{
    __shared__ int sharedMem[BLOCK_SIZE + 2 * RADIUS];  // Allocate shared memory

    int localIdx = threadIdx.x + RADIUS;
    int globIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    sharedMem[localIdx] = in[globIdx];
    
    // Load halo data
    if (threadIdx.x < RADIUS) {
        sharedMem[localIdx - RADIUS] = in[globIdx - RADIUS];
        sharedMem[localIdx + BLOCK_SIZE] = in[globIdx + BLOCK_SIZE];
    }
    
    __syncthreads();  // Synchronize threads to ensure all data is loaded

    int value = 0;
    for(int offset = -RADIUS; offset <= RADIUS; offset++)
        value += sharedMem[localIdx + offset];  // Use shared memory for computation
    
    out[globIdx] = value;
}