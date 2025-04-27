#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Early return if 'offset' is out of bounds
    if(offset >= size) return;

    // Inline computation for better performance
    float bias = biases[filter];
    output[(batch * n + filter) * size + offset] *= bias;
}