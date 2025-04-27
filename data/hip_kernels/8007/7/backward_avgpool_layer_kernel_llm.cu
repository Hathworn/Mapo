#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D indexing
    if (id >= n) return;

    int b = id / c;
    int k = id % c;

    float out_delta_val = out_delta[k + c * b];  // Preload out_delta value for reuse
    int stride = h * w;
    int base_in_index = b * c * stride + k * stride;

    for (int i = 0; i < w * h; ++i) {
        atomicAdd(&in_delta[base_in_index + i], out_delta_val / (w * h)); // Use atomicAdd for concurrent writing
    }
}