#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void And(bool *x, size_t idx, size_t N)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to handle larger N efficiently
    int stride = blockDim.x * gridDim.x;
    for (; i < N; i += stride)
    {
        x[(idx - 2) * N + i] = x[(idx - 2) * N + i] & x[(idx - 1) * N + i];
    }
}