#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;
    
    // Compute unique indices for each thread
    int b = id / c;
    int k = id % c;
    int out_index = k + c * b;

    // Pre-compute normalization factor
    float norm_factor = 1.0f / (w * h);
    
    int in_offset = h * w * (k + b * c);
    for (int i = 0; i < w * h; ++i) {
        // Use pre-computed offset and normalization factor
        atomicAdd(&in_delta[in_offset + i], out_delta[out_index] * norm_factor);
    }
}