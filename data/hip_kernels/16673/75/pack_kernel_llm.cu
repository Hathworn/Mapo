#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pack_kernel(float *d_output, float *d_input, float *d_predicates, float *d_scanned, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    if (idx < length)
    {
        // Check predicate and gather in one operation
        if (d_predicates[idx] != 0.f)
        {
            int address = __float_as_int(d_scanned[idx]) - 1;
            d_output[address] = d_input[idx];
        }
    }
}