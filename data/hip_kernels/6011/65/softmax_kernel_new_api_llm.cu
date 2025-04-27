#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device_new_api(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    for (i = 0; i < n; ++i) {
        float val = input[i * stride]; // Optimize data type from int to float
        largest = fmaxf(val, largest); // Using intrinsic for max
    }
    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp); // Precompute part of the exp
        sum += e;
        output[i * stride] = e;
    }
    sum = 1.0f / sum; // Compute reciprocal once
    for (i = 0; i < n; ++i) {
        output[i * stride] *= sum; // Use precomputed reciprocal
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    for(i = 0; i < n; ++i){
        float val = input[i]; // Optimize data type from int to float
        largest = fmaxf(val, largest); // Using intrinsic for max
    }
    for(i = 0; i < n; ++i){
        float e = expf((input[i] - largest) / temp); // Precompute part of the exp
        sum += e;
        output[i] = e;
    }
    sum = 1.0f / sum; // Compute reciprocal once
    for(i = 0; i < n; ++i){
        output[i] *= sum; // Use precomputed reciprocal
    }
}

__global__ void softmax_kernel_new_api(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread ID calculation
    if (id >= batch * groups) return;
    int b = id / groups;
    int g = id % groups;
    softmax_device_new_api(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}