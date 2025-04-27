#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_Optimized(float *a, float *b, float *c, float scalar, size_t len)
{
    // Calculate the thread's global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Improved loop: Iterate over multiple elements per thread to increase occupancy
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + scalar * b[i];
    }
}