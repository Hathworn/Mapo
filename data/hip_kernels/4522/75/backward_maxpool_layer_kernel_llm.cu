#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;
    int area = (size - 1) / stride;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int index = id;
    int j = index % in_w;
    index /= in_w;
    int i = index % in_h;
    index /= in_h;
    int k = index % in_c;
    index /= in_c;
    int b = index;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float d = 0.0f;

    int out_w_base = (j - w_offset) / stride;
    int out_h_base = (i - h_offset) / stride;

    #pragma unroll // Unroll loops for improved performance
    for (int l = -area; l <= area; ++l) {
        int out_h = out_h_base + l;
        if (out_h < 0 || out_h >= h) continue;

        #pragma unroll
        for (int m = -area; m <= area; ++m) {
            int out_w = out_w_base + m;
            if (out_w < 0 || out_w >= w) continue;

            int out_index = out_w + w * (out_h + h * (k + c * b));
            if (indexes[out_index] == id) { // Check index match
                d += delta[out_index];
            }
        }
    }

    prev_delta[id] += d;
}