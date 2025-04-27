#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Calculate indices
    int k = id % c;
    int b = id / c;

    // Precompute factor to minimize redundant division
    float scale = 1.0f / (w * h);
    
    // Optimize loop by using unrolled access pattern for in_delta
    for(int i = 0; i < w * h; ++i){
        // Compute indices once per iteration
        int in_index = i + h * w * (k + b * c);
        int out_index = k + c * b;

        // Update in_delta using precomputed scale
        in_delta[in_index] += out_delta[out_index] * scale;
    }
}