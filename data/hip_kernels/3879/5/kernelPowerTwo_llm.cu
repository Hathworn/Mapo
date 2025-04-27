#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelPowerTwo(const float *a, const float *b, const unsigned int length, float *a2, float *b2)
{
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within array bounds
    if (idx < length) {
        // Efficiently calculate squares
        a2[idx] = a[idx] * a[idx];
        b2[idx] = b[idx] * b[idx];
    }
}