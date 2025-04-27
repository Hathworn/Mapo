#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constant_mul_kernel(const float *data_l, float constant, float *result, int total)
{
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int data_idx = 2 * idx;

    // Ensure the index is within bounds
    if (idx < total) {
        // Perform multiplication using coalesced memory access
        result[data_idx] = data_l[data_idx] * constant;
        result[data_idx + 1] = data_l[data_idx + 1] * constant;
    }
}