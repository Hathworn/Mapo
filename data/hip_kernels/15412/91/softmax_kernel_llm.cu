#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    // Loop to find the largest element for numerical stability
    for(i = 0; i < n; ++i){
        float val = input[i];
        largest = (val > largest) ? val : largest;
    }
    // Compute exponentials and sum
    for(i = 0; i < n; ++i){
        float e = exp(input[i] / temp - largest / temp);
        sum += e;
        output[i] = e;
    }
    // Normalize the output
    for(i = 0; i < n; ++i){
        output[i] /= sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    // Calculate unique index for each thread
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if(b >= batch) return;
    softmax_device(n, input + b * offset, temp, output + b * offset);
}