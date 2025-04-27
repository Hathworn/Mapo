#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(const float *xs, const float *ys, float *out, const unsigned int N)
{
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Using stride-based loop to optimize global memory access
    for (unsigned int i = idx; i < N; i += blockDim.x * gridDim.x)
    {
        out[i] = xs[i] + ys[i];
    }
}