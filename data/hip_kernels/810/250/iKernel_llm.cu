#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iKernel(float *src, float *dst, int n)
{
    // Calculate global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (idx < n) {
        // Perform the computation
        dst[idx] = src[idx] * 2.0f;
    }
}