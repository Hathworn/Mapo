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

    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float d = 0;
    int out_w_start = (j - w_offset) / stride - area;
    int out_h_start = (i - h_offset) / stride - area;
    int out_w_end = out_w_start + 2 * area + 1;
    int out_h_end = out_h_start + 2 * area + 1;

    // Restrict the range to valid output indices
    out_w_start = max(out_w_start, 0);
    out_w_end = min(out_w_end, w);
    out_h_start = max(out_h_start, 0);
    out_h_end = min(out_h_end, h);

    // Compute deltas
    for (int out_h = out_h_start; out_h < out_h_end; ++out_h) {
        for (int out_w = out_w_start; out_w < out_w_end; ++out_w) {
            int out_index = out_w + w * (out_h + h * (k + c * b));
            if (indexes[out_index] == id) {
                d += delta[out_index];
            }
        }
    }
    prev_delta[id] += d;
}