#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c; // Optimized division for better performance

    int out_index = k + c * b;
    float scale = 1.0f / (w * h); // Pre-compute scale factor

    // Unrolling the loop for better performance
    int steps = w * h;
    for(int i = 0; i < steps; i++) {
        int in_index = i + w * h * out_index;
        in_delta[in_index] += out_delta[out_index] * scale;
    }
}