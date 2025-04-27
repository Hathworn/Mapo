#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *src, float *dst)
{
    // Use shared memory for faster access if needed
    extern __shared__ float sdata[];

    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    sdata[threadIdx.x] = src[idx];

    // Wait for all threads to finish loading
    __syncthreads();

    // Compute using shared memory
    dst[idx] = sdata[threadIdx.x] * 2.0f;
}