```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D grid launch
    if(id >= n * c) return; // Should iterate over n * c

    int k = id % c; 
    int b = id / c; 

    int out_index = k + c * b;
    float sum = 0.0f;
    int offset = h * w * (k + b * c);
    
    for(int i = 0; i < w * h; ++i){
        sum += input[i + offset];
    }

    output[out_index] = sum / (w * h); // Pre-divide to improve performance
}