#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _bcnn_backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, float *diff, float *prev_delta, int *indexes)
{
    // Pre-compute constants
    int h = (in_h - 1) / stride + 1;
    int w = (in_w - 1) / stride + 1;
    int area = (size - 1) / stride;
    int w_offset = (-size - 1) / 2 + 1;
    int h_offset = (-size - 1) / 2 + 1;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) {
        return;
    }

    // Simplified index computation
    int j = id % in_w;
    int i = (id / in_w) % in_h;
    int k = (id / (in_w * in_h)) % in_c;
    int b = id / (in_w * in_h * in_c);

    float d = 0.0f;
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                int out_index = out_w + w * (out_h + h * (k + c * b));
                if (indexes[out_index] == id) {
                    d += diff[out_index];
                }
            }
        }
    }
    prev_delta[id] += d;
}