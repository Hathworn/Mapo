#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Use blockIdx.x and threadIdx.x for indexing
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Compute k and b using efficient integer division/modulo
    int k = id % c;
    int b = id / c;

    // Precompute shared memory for division result
    float scale = 1.0f / (w * h);

    // Loop through width and height times
    int out_index = k + c * b;
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + h * w * (k + b * c);
        in_delta[in_index] += out_delta[out_index] * scale;
    }
}