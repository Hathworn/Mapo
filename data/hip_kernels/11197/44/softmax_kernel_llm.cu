#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    for(i = 0; i < n; ++i){
        float val = input[i*stride];  // Use float for val instead of int
        largest = (val>largest) ? val : largest;
    }
    for(i = 0; i < n; ++i){
        float e = expf((input[i*stride] - largest) / temp);  // Optimize by combining expressions and using expf
        sum += e;
        output[i*stride] = e;
    }
    float inv_sum = 1.0f / sum;  // Compute inverse of sum once
    for(i = 0; i < n; ++i){
        output[i*stride] *= inv_sum;  // Multiply by inverse to divide
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;  // Optimize index calculation
    if (id < batch * groups) {  // Simplify boundary check
        int b = id / groups;
        int g = id % groups;
        softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
    }
}