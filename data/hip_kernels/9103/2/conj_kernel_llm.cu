#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conj_kernel(const float *data, float *result, int total)
{
    // Calculate index in a more efficient way using '2 * threadIdx.x'
    int idx = 2 * threadIdx.x + 2 * blockIdx.x * blockDim.x;

    if (idx < 2 * total) {
        result[idx] = data[idx];              // Copy real part
        result[idx + 1] = -data[idx + 1];     // Negate imaginary part
    }
}