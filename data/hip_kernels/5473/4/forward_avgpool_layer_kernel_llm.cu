#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c; // Simplified division calculation

    float sum = 0.0f; // Accumulate sum locally
    int area = w * h; // Pre-compute area to avoid repetitive calculation
    int out_index = k + c * b;
    int base_index = h * w * (k + b * c); // Pre-compute base index

    for(int i = 0; i < area; ++i) {
        sum += input[i + base_index]; // Use pre-computed base index
    }
    
    output[out_index] = sum / area; // Directly assign averaged value to output
}