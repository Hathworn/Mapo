#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread index
    if (id >= n) return;

    int k = id % c;
    int b = id / c; // Use integer division to compute b

    float scale = 1.0f / (w * h); // Precompute scale factor for average
    int out_index = k + c * b; 

    for (int i = 0; i < w * h; ++i)
    {
        int in_index = i + h * w * (k + b * c);
        in_delta[in_index] += out_delta[out_index] * scale; // Utilize precomputed scale
    }
}