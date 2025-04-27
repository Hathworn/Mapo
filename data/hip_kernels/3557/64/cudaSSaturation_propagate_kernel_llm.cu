#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSaturation_propagate_kernel(float* x, float* y, unsigned int size, float threshold)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    if (threshold == 0.0f) return; // Early exit if threshold is zero

    for (unsigned int i = index; i < size; i += stride) {
        float value = x[i];
        // Use fminf and fmaxf for more efficient clamping
        y[i] = fmaxf(fminf(value, threshold), -threshold);
    }
}