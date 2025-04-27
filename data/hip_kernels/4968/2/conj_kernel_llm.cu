#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conj_kernel(const float *data, float *result, int total)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread processes a pair of elements
    int doubleIdx = 2 * idx;

    // Ensure index is within bounds
    if (idx < total) {
        // Copy and negate the imaginary part
        result[doubleIdx] = data[doubleIdx];
        result[doubleIdx + 1] = -data[doubleIdx + 1];
    }
}