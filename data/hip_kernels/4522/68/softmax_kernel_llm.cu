#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    
    // Unroll loop for better performance
    #pragma unroll
    for (i = 0; i < n; ++i) {
        float val = input[i * stride]; // Correct type and use float
        largest = fmaxf(largest, val); // Use fmaxf for float comparison
    }
    
    #pragma unroll
    for (i = 0; i < n; ++i) {
        float e = expf(input[i * stride] / temp - largest / temp);
        sum += e;
        output[i * stride] = e;
    }
    
    float inv_sum = 1.0f / sum; // Calculate inverse of sum for efficiency
    #pragma unroll
    for (i = 0; i < n; ++i) {
        output[i * stride] *= inv_sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation
    if (id >= batch * groups) return;
    
    int b = id / groups;
    int g = id % groups;

    // Optimize memory access with offsets
    float *input_ptr = input + b * batch_offset + g * group_offset;
    float *output_ptr = output + b * batch_offset + g * group_offset;

    softmax_device(input_ptr, n, temp, stride, output_ptr);
}