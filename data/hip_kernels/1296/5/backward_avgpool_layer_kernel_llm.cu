#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c; // Calculate channel index
    id /= c;
    int b = id; // Calculate batch index

    int out_index = k + c * b;
    float scale = 1.0f / (w * h); // Precompute division for optimization

    // Consolidate computation and memory access to improve performance
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + w * h * out_index;
        in_delta[in_index] += out_delta[out_index] * scale;
    }
}