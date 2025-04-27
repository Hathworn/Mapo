#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Calculate maximum value
    for (int i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = (val > largest) ? val : largest;
    }

    // Compute exponentials and sum
    for (int i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp); // Optimize calculation using largest
        sum += e;
        output[i * stride] = e;
    }

    // Normalize the output values
    float invSum = 1.0f / sum; // Calculate multiplicative inverse once
    for (int i = 0; i < n; ++i) {
        output[i * stride] *= invSum; // Use multiplication instead of division for better performance
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    
    int b = id / groups;
    int g = id % groups;

    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}