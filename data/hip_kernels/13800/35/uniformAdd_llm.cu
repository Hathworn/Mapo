#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniformAdd(unsigned int n, unsigned int *data, unsigned int *inter)
{
    __shared__ unsigned int uni;
    
    // Load shared data only by the first thread
    if (threadIdx.x == 0) {
        uni = inter[blockIdx.x];
    }
    
    __syncthreads();

    // Use grid-stride loop to enable more efficient memory access and handle different sizes
    for (unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x; 
         i < n; 
         i += blockDim.x * gridDim.x * 2) {
        if (i < n) data[i] += uni;
        if (i + blockDim.x < n) data[i + blockDim.x] += uni;
    }
}