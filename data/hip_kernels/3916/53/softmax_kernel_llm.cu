#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) 
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Use a single pass to find the largest value
    for (i = 0; i < n; ++i) {
        float val = input[i * stride];  // Ensure float type for `val`
        if (val > largest) largest = val;
    }

    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);  // Simplify exponent calculation
        sum += e;
        output[i * stride] = e;
    }

    sum = 1.0f / sum;  // Calculate reciprocal once
    for (i = 0; i < n; ++i) {
        output[i * stride] *= sum;  // Multiply once
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output) 
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;  // Simplify id calculation
    if (id >= batch * groups) return;

    int b = id / groups;
    int g = id % groups;

    // Call optimized device function
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}