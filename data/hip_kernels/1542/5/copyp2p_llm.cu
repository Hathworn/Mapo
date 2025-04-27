#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyp2p(int4* __restrict__ dest, const int4* __restrict__ src, size_t num_elems)
{
    size_t globalId = blockIdx.x * blockDim.x + threadIdx.x;
    size_t gridSize = blockDim.x * gridDim.x;

    // Use loop unrolling and restrict keyword for performance optimization
    #pragma unroll
    for (size_t i = globalId; i < num_elems; i += gridSize)
    {
        dest[i] = src[i];
    }
}