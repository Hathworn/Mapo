#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void skip_add(size_t sz, float_t* f1, float* skip_out_sum)
{
    // Use a single variable to compute the global index, for clarity.
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    // Check boundary and perform addition in one step for efficiency.
    if (index < sz) {
        skip_out_sum[index] = skip_out_sum[index] + f1[index];
    }
}