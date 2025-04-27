#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void predicate_kernel(float *d_predicates, float *d_input, int length)
{
    // Calculate global thread index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure idx is within bounds using a grid-stride loop for better parallelism
    for (int i = idx; i < length; i += gridDim.x * blockDim.x) {
        d_predicates[i] = d_input[i] > FLT_ZERO;
    }
}