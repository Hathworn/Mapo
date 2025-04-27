#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c;
    int b = id / c;

    float out_val = out_delta[k + c * b] / (w * h);  // Precompute division to reduce redundant operations
    int offset = h * w * (k + b * c);

    // Use a pointer to reduce repeated index computation
    float *in_ptr = in_delta + offset;

    for (int i = 0; i < w * h; ++i) {
        in_ptr[i] += out_val;
    }
}