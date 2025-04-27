#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    float sum = 0;
    float largest = -INFINITY;
    // Use parallel reduction to find the largest value
    for(int i = 0; i < n; ++i){
        float val = input[i];
        largest = fmaxf(val, largest);
    }
    for(int i = 0; i < n; ++i){
        float e = expf((input[i] - largest) / temp);  // Optimize temp division outside exp
        sum += e;
        output[i] = e;
    }
    // Inverse sum needed
    float sum_inv = 1.0f / sum;
    for(int i = 0; i < n; ++i){
        output[i] *= sum_inv;  // Replace division with multiplication
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify block and thread index calculation
    if(b >= batch) return;
    softmax_device(n, input + b*offset, temp, output + b*offset);
}