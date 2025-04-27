#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSinv_kernel(unsigned int size, const float *x, float *y)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Optimize: Use shared memory for faster access
    __shared__ float sharedX[256];
    
    for (unsigned int i = index; i < size; i += stride) {
        sharedX[threadIdx.x] = x[i];
        __syncthreads();
        
        // Perform computation using shared memory
        y[i] = 1.0f / sharedX[threadIdx.x];
        
        __syncthreads();
    }
}