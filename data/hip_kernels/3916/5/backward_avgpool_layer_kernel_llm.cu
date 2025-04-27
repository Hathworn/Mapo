```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Combine blockIdx dimensions and threadIdx to get a unique thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float scale = out_delta[out_index] / (w * h);

    // Use a single index variable for the loop to reduce computations inside the loop
    for(int i = 0; i < w * h; ++i){
        int in_index = i + h * w * (k + b * c);
        in_delta[in_index] += scale; // Pre-compute scale to optimize division
    }
}