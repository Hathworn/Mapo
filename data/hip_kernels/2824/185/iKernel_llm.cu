#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *src, float *dst)
{
    // Use shared memory for reduced global memory access
    extern __shared__ float shared_src[];
    
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int tid = threadIdx.x;

    // Load data into shared memory
    shared_src[tid] = src[idx];
    __syncthreads();

    // Perform computation using shared memory
    dst[idx] = shared_src[tid] * 2.0f;
}