#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes) {

    // Calculate output dimensions
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    // Calculate unique thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate original indices
    int index = id;
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0;

    // Loop over the pooling window
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = (j + w_offset) / stride + m;  // Corrected calculation
            int out_h = (i + h_offset) / stride + l;  // Corrected calculation
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                int out_index = out_w + w * (out_h + h * (k + c * b));
                d += (indexes[out_index] == index) ? delta[out_index] : 0;
            }
        }
    }
    atomicAdd(&prev_delta[index], d);  // Use atomic operation for thread safety
}