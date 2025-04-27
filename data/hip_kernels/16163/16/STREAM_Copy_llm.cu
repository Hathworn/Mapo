#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy(float *a, float *b, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x; // Pre-calculate stride for efficiency
    for (; idx < len; idx += stride) {      // Use for loop for better readability and optimization
        b[idx] = a[idx];
    }
}