#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Find the largest element in the input
    for(int i = 0; i < n; ++i){
        float val = input[i*stride];
        largest = fmaxf(val, largest);  // Use fmaxf to simplify
    }

    // Calculate exponentials and their sum
    for(int i = 0; i < n; ++i){
        float e = expf((input[i*stride] - largest) / temp);  // Simplified the expression
        sum += e;
        output[i*stride] = e;
    }

    // Normalize the output based on the sum of exponentials
    for(int i = 0; i < n; ++i){
        output[i*stride] /= sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified ID calculation
    if (id >= batch * groups) return;

    // Calculate batch and group indices
    int b = id / groups;
    int g = id % groups;

    // Call the device function for softmax calculation
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}