#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0.0f;
    float largest = -INFINITY;
    
    // Use threads to find the largest value
    for (i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = fmaxf(largest, val);
    }
    
    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }
    
    float inv_sum = 1.0f / sum;
    
    // Normalize using precomputed inverse of sum for efficiency
    for (i = 0; i < n; ++i) {
        output[i * stride] *= inv_sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    
    int b = id / groups;
    int g = id % groups;
    
    // Use cooperative loading of batch and group data
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}