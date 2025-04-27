#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes) {
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;
    int area = (size - 1) / stride;

    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Compute the index positions in the flattened input array
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

    float d = 0;

    // Using one loop for better warp execution
    for (int m = -area; m <= area; ++m) {
        for (int l = -area; l <= area; ++l) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;

            // Calculate output index
            int out_index = out_w + w * (out_h + h * (k + c * b));
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h && indexes[out_index] == (i * in_w + j + in_h * in_c * b + k * in_h * in_w)) {
                d += delta[out_index];
            }
        }
    }
    prev_delta[i * in_w + j + in_h * in_c * b + k * in_h * in_w] += d;
}