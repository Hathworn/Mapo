#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniformAdd(unsigned int n, unsigned int *data, unsigned int *inter) 
{
    // Utilize shared memory to efficiently load the uniform value
    __shared__ unsigned int uni;
    if (threadIdx.x == 0) { 
        uni = inter[blockIdx.x]; 
    }
    __syncthreads();

    // Calculate the global index using threadIdx, blockIdx, and blockDim
    unsigned int g_ai = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // Perform addition if the global index is within the valid range
    if (g_ai < n) {
        data[g_ai] += uni;  // Handle the first element
        // Check and handle the second element only if it's within bounds
        if (g_ai + blockDim.x < n) {  
            data[g_ai + blockDim.x] += uni;
        }
    }
}