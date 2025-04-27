#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int spatial_size = w * h;  // Calculate once
    int k = id % c;
    int b = id / c;  // Direct division for batch index

    int out_index = k + c * b;
    float delta_val = out_delta[out_index] / spatial_size;  // Compute only once

    int base_index = h * w * (k + b * c);
    for (int i = 0; i < spatial_size; ++i) {
        int in_index = i + base_index;
        in_delta[in_index] += delta_val;
    }
}