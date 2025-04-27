#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;
    int area = (size - 1) / stride;

    int id = blockIdx.x * blockDim.x + threadIdx.x; // Compute 1D index
    if (id >= n) return;

    int j = id % in_w;
    int i = (id / in_w) % in_h;
    int k = (id / (in_w * in_h)) % in_c;
    int b = id / (in_c * in_h * in_w);

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float d = 0.0f;
    int out_w = 0, out_h = 0, out_index = 0, valid = 0;

    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            out_w = (j - w_offset) / stride + m;
            out_h = (i - h_offset) / stride + l;
            out_index = out_w + w * (out_h + h * (k + c * b));
            valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);
            d += (valid && indexes[out_index] == id) ? delta[out_index] : 0.0f; // Simplified condition and accumulation
        }
    }
    prev_delta[id] += d; // Update prev_delta once
}