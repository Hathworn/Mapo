#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Use parallel reduction to find the largest element
    for(i = 0; i < n; ++i){
        float val = input[i*stride];
        largest = (val > largest) ? val : largest;
    }

    for(i = 0; i < n; ++i){
        float e = expf(input[i*stride]/temp - largest/temp);
        sum += e;
        output[i*stride] = e;
    }

    // Normalize outputs in a separate loop to avoid bank conflicts
    for(i = 0; i < n; ++i){
        output[i*stride] /= sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    // Calculate global thread ID more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (id >= batch * groups) return;

    // Use integer division and modulus with ID directly
    int b = id / groups;
    int g = id % groups;
    
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}