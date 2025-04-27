#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    int in_offset = h * w * (k + b * c);
    float scaled_out_delta = out_delta[out_index] / (w * h);

    // Use loop unrolling for efficiency
    int i = 0;
    for(; i <= w * h - 4; i += 4) {
        in_delta[in_offset + i] += scaled_out_delta;
        in_delta[in_offset + i + 1] += scaled_out_delta;
        in_delta[in_offset + i + 2] += scaled_out_delta;
        in_delta[in_offset + i + 3] += scaled_out_delta;
    }
    for(; i < w * h; ++i) {
        in_delta[in_offset + i] += scaled_out_delta;
    }
}