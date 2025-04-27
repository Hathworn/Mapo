#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy(int *src, int *dest)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Use `__syncthreads()` for synchronization
    __syncthreads();
    
    if (idx < WIDTH && idy < HEIGHT) 
    {
        // Coalesced memory access
        int index = idy * WIDTH + idx;
        dest[index] = src[index];
    }
}