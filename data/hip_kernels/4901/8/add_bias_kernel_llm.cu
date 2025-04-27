#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Ensure offset is within bounds
    if(offset >= size) return;

    // Precompute index for repeated use
    int index = (batch * n + filter) * size + offset;

    // Add bias to output
    output[index] += biases[filter];
}