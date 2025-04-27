#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *src, float *dst)
{
    // Utilize shared memory for improved memory access efficiency
    extern __shared__ float shared_src[];
    
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    shared_src[threadIdx.x] = src[idx];
    __syncthreads();
    
    // Perform computation using shared memory
    dst[idx] = shared_src[threadIdx.x] * 2.0f;
}