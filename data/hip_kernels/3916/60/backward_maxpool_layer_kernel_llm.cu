#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Calculate the output dimensions
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    // Thread index
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

    int w_offset = -pad;
    int h_offset = -pad;

    // Initialize delta accumulator
    float d = 0;

    // Use loop unrolling for small 'area' ranges
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            int out_index = out_w + w * (out_h + h * (k + c * b));
            bool valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);

            // Leverage boolean short-circuit and skip unnecessary operations
            if (valid && indexes[out_index] == id) {
                d += delta[out_index];
            }
        }
    }

    // Accumulate the calculated delta
    prev_delta[id] += d;
}