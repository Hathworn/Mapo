#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_double(double *a, double *b, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Unroll loop for better parallelism and memory access pattern
    for(; idx < len; idx += blockDim.x * gridDim.x) {
        b[idx] = a[idx];
    }
}