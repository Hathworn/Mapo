#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract( float * x, size_t idx, size_t N, float W0, float W1)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling through stride
    const int stride = blockDim.x * gridDim.x;

    // Optimize by processing multiple elements per thread with coalesced memory access
    for (; i < N; i += stride)
    {
        float val1 = x[(idx-1)*N + i];
        float val2 = x[(idx-2)*N + i];
        x[(idx-2)*N + i] = W0 * val1 - W1 * val2;
    }
}