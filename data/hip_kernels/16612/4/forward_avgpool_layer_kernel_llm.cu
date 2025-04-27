#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;
    int out_index = k + c * b;
    int in_start_index = h * w * (k + b * c);
    int in_end_index = in_start_index + w * h;
    
    // Optimize: Accumulate using thread-local variable
    float sum = 0.0f;
    for (int i = in_start_index; i < in_end_index; ++i) {
        sum += input[i];
    }
    
    // More efficient to divide just once
    output[out_index] = sum / (w * h);
}