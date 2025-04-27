#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c;
    int b = id / c;
    int out_index = k + c * b;
    float out_value = out_delta[out_index] / (w * h); // Precompute division

    for (int i = 0; i < w * h; ++i) {
        int in_index = i + w * h * out_index; // Optimize index calculation
        atomicAdd(&in_delta[in_index], out_value); // Use atomicAdd for thread safety
    }
}