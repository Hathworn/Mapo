#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pack_kernel(float *d_output, float *d_input, float *d_predicates, float *d_scanned, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    if (idx >= length) return;

    // Combine condition check and computation to reduce branch instructions
    float predicate = d_predicates[idx];
    if (predicate != 0.f)
    {
        // Precompute address before conditional statement
        int address = static_cast<int>(d_scanned[idx]) - 1;
        
        // Use conditional assignment to reduce divergent branches
        d_output[address] = d_input[idx];
    }
}