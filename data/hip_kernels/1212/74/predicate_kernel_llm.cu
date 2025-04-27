#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void predicate_kernel(float *d_predicates, float *d_input, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread only processes valid data
    if (idx < length) {
        d_predicates[idx] = d_input[idx] > FLT_ZERO; // Simplified comparison
    }
}