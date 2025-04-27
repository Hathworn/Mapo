#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    if (offset >= size) return; // Early exit for non-valid threads

    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Use registers for repeated index calculations
    int idx = (batch * n + filter) * size + offset;
    output[idx] *= biases[filter];
}