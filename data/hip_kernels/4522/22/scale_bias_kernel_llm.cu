#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Calculate the global index once and reuse it
    int global_index = (batch * n + filter) * size + offset;

    // Perform boundary check and apply bias
    if(offset < size) output[global_index] *= biases[filter];
}