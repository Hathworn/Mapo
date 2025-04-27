#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iKernel(float *src, float *dst, int size)
{
    // Calculate the global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread is within bounds
    if (idx < size) {
        // Perform the computation
        dst[idx] = src[idx] * 2.0f;
    }
}