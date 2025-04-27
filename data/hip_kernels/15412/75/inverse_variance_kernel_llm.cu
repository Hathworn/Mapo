#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inverse_variance_kernel(int size, float *src, float *dst, float epsilon)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Use fast math functions; optimize memory access and computation
        float val = __ldg(&src[index]); // Use __ldg for read-only operations
        dst[index] = rsqrtf(val + epsilon); // Use rsqrtf for fast reciprocal square root
    }
}