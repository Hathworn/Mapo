#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy(float *a, float *b, size_t len)
{
    // Use restrict to enable compiler optimizations 
    float* __restrict__ a_ptr = a;
    float* __restrict__ b_ptr = b;

    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Unroll loop for improved throughput
    for (; idx + 3 < len; idx += blockDim.x * gridDim.x * 4) {
        b_ptr[idx] = a_ptr[idx];
        b_ptr[idx + 1] = a_ptr[idx + 1];
        b_ptr[idx + 2] = a_ptr[idx + 2];
        b_ptr[idx + 3] = a_ptr[idx + 3];
    }

    // Handle remaining elements
    while (idx < len) {
        b_ptr[idx] = a_ptr[idx];
        idx += blockDim.x * gridDim.x;
    }
}