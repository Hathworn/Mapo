```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    // Check if the thread id is within the valid range
    if(id >= n) return;
    
    int k = id % c;
    int b = id / c;
    int out_index = k + c * b;

    // Initialize output element
    float sum = 0.0f;
    
    // Optimize memory access by using local variable 'sum'
    for(int i = 0; i < w * h; ++i){
        int in_index = i + h * w * (k + b * c);
        sum += input[in_index];
    }
    // Finalize the average for current output element
    output[out_index] = sum / (w * h);
}