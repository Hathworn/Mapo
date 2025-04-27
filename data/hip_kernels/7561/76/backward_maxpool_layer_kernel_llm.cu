#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate the global thread ID
    if (id >= n) return;

    int j = id % in_w;
    int i = (id / in_w) % in_h;
    int k = (id / in_w / in_h) % in_c;
    int b = id / in_w / in_h / in_c;

    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;
    int area = (size - 1) / stride;

    float d = 0;
    for (int l = -area; l <= area; ++l) {  // Combine loop conditions
        for (int m = -area; m <= area; ++m) {  // Combine loop conditions
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            // Simplify index calculations into a single conditional expression
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                int out_index = out_w + w * (out_h + h * (k + c * b));
                if (indexes[out_index] == id) {
                    d += delta[out_index];
                }
            }
        }
    }
    prev_delta[id] += d;
}