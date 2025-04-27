#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * c) return; // Combined bounds check

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    int base_in_index = h * w * (k + b * c); // Precompute the base input index

    // Unroll the loop for better performance
    for (int i = 0; i < w * h; i += 1) {
        int in_index = base_in_index + i;
        in_delta[in_index] += out_delta[out_index] / (w * h);
    }
}