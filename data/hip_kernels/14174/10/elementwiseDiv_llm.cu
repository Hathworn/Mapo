#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwiseDiv(float *a, const float *b, const size_t len)
{
    // Calculate index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop to handle array elements beyond blockDim.x
    for (; idx < len; idx += gridDim.x * blockDim.x) {
        a[idx] /= b[idx] + 1e-6f;
    }
}