#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaSpow_kernel(unsigned int size, float power, const float *x, float *y)
{
    // Calculate global index once
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Optimize by unrolling the loop
    for (unsigned int i = index; i < size; i += stride * 4) {
        if (i < size) y[i] = powf(x[i], power);
        if (i + stride < size) y[i + stride] = powf(x[i + stride], power);
        if (i + 2 * stride < size) y[i + 2 * stride] = powf(x[i + 2 * stride], power);
        if (i + 3 * stride < size) y[i + 3 * stride] = powf(x[i + 3 * stride], power);
    }
}