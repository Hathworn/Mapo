#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate global thread index and filter value
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;

    // Only proceed if idx is within valid range
    if(idx < size) {
        // Calculate output index and apply bias scaling
        int output_idx = (blockIdx.z * n + filter) * size + idx;
        output[output_idx] *= biases[filter];
    }
}