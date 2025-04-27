#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad(float *a, float *b, float *c, float scalar, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x; // Precompute the stride for better performance
    for (size_t i = idx; i < len; i += stride) { // Use a for loop for better readability
        c[i] = a[i] + scalar * b[i]; // Optimize memory access by computing within the loop
    }
}