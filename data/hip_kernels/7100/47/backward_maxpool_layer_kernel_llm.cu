#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;
    
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate b, k, i, j using modulo and divide operations
    int index = id;
    int j = index % in_w;
    index /= in_w;
    int i = index % in_h;
    index /= in_h;
    int k = index % in_c;
    int b = index / in_c;

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0.0f;

    // Pre-calculate common factors outside of loops
    int base_out_index = k + c * b;

    // Use more efficient boundary calculations in loops
    for (int l = -area; l <= area; ++l) {
        int out_h = (i - h_offset) / stride + l;
        if (out_h < 0 || out_h >= h) continue;  // Skip out-of-bounds heights
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            if (out_w < 0 || out_w >= w) continue;  // Skip out-of-bounds widths
            int out_index = out_w + w * (out_h + h * base_out_index);
            if (indexes[out_index] == id) {  // Check if index matches and add delta
                d += delta[out_index];
            }
        }
    }
    prev_delta[id] += d;  // Accumulate the result into prev_delta
}