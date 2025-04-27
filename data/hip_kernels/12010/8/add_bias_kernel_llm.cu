#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Exit early if thread offset is outside of valid range
    if (offset >= size) return;

    // Compute index and update output with bias
    int index = (batch * n + filter) * size + offset;
    output[index] += biases[filter];
}