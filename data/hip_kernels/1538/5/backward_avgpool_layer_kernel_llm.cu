#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Returned early if out of bounds
    if(id >= n) return;

    // Calculate spatial location
    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float scale_factor = 1.0f / (w * h); // Precompute scale factor
    int base_in_index = h * w * (k + b * c); // Precompute base in_index

    for(int i = 0; i < w * h; ++i) {
        int in_index = base_in_index + i;
        in_delta[in_index] += out_delta[out_index] * scale_factor; // Use multiplication instead of division
    }
}