#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    float sum = 0;
    float largest = -INFINITY;

    // Use a single loop to find the largest element and compute exponentials
    for(int i = 0; i < n; ++i){
        float val = input[i];
        largest = (val > largest) ? val : largest;
    }
    float exp_values[n];
    for(int i = 0; i < n; ++i){
        exp_values[i] = exp((input[i] - largest) / temp);
        sum += exp_values[i];
    }
 
    // Normalize the output in the same loop for better cache locality
    for(int i = 0; i < n; ++i){
        output[i] = exp_values[i] / sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if(b < batch) {
        softmax_device(n, input + b * offset, temp, output + b * offset);
    }
}