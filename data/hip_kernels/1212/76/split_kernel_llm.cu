#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void split_kernel(float *d_output, float *d_input, float *d_predicates, float *d_scanned, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Return early if the thread index exceeds the length
    if (idx >= length) return;

    // Use a predicate check to minimize branching and improve memory coalescing
    int address = d_scanned[idx] - 1;
    d_output[idx] = (d_predicates[idx] != 0.f) ? d_input[address] : 0.0f;
}