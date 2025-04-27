#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;

    // Find the largest element within the input
    for(int i = 0; i < n; ++i){
        float val = input[i * stride];
        largest = fmaxf(largest, val);
    }

    // Calculate exponentials and sum them up
    for(int i = 0; i < n; ++i){
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Normalize the results
    float inv_sum = 1.0f / sum; // Compute inverse sum once
    for(int i = 0; i < n; ++i){
        output[i * stride] *= inv_sum; // Use multiplication instead of division
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    // Calculate unique thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 
    if (id >= batch * groups) return;

    int b = id / groups;
    int g = id % groups;

    // Pass the input and output pointers to softmax_device function
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}