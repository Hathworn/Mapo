#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *src, float *dst)
{
    // Calculate the global thread index
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Optimize memory access by checking idx boundary
    if (idx < gridDim.x * blockDim.x) {
        dst[idx] = src[idx] * 2.0f;
    }
}