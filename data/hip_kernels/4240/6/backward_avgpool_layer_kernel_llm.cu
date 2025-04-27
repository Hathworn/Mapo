#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (id >= n) return;

    // Compute indices
    int k = id % c;
    int b = id / c;
    int out_index = k + c * b;

    // Cache division result
    float inv_wh = 1.0f / (w * h);

    // Iterate over width*height
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + w * h * (k + b * c);
        // Update delta with pooled average
        in_delta[in_index] += out_delta[out_index] * inv_wh;
    }
}