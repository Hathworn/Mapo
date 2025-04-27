#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes) {
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;
    int area = (size - 1) / stride;

    int id = blockIdx.x * blockDim.x + threadIdx.x; // Flattened block and thread index for 1D grid
    if (id >= n) return;

    int j = id % in_w;
    int i = (id / in_w) % in_h;
    int k = (id / (in_w * in_h)) % in_c;
    int b = id / (in_c * in_w * in_h);

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float d = 0.0f;

    // Unrolling the loop to improve performance
    #pragma unroll
    for (int l = -area; l <= area; ++l) {
        int out_h = (i - h_offset) / stride + l;
        if (out_h < 0 || out_h >= h) continue; // Check valid range for out_h only once

        #pragma unroll
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            if (out_w < 0 || out_w >= w) continue; // Check valid range for out_w only once

            int out_index = out_w + w * (out_h + h * (k + c * b));
            if (indexes[out_index] == id) { // Reduce branching and computation
                d += delta[out_index];
            }
        }
    }

    prev_delta[id] += d; // Update previous delta
}