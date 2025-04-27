#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conj_kernel(const float *data, float *result, int total)
{
    // Use a single thread per complex number to optimize memory access
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < total) {
        int offset = 2 * idx; // Calculate offset for real and imaginary components
        result[offset] = data[offset];
        result[offset + 1] = -data[offset + 1];
    }
}