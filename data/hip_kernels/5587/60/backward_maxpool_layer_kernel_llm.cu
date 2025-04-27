#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int index = id;
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    const int w_offset = -pad;
    const int h_offset = -pad;

    float d = 0.0f;

    // Precompute fixed values for clarity
    int base_out_w = (j - w_offset) / stride;
    int base_out_h = (i - h_offset) / stride;
    int base_index = k + c * b;
    
    // Iterate more efficiently by calculating the out indices only once
    for (int l = -area; l <= area; ++l) {
        int out_h = base_out_h + l;
        if (out_h >= 0 && out_h < h) {  // Check row validity
            for (int m = -area; m <= area; ++m) {
                int out_w = base_out_w + m;
                if (out_w >= 0 && out_w < w) {  // Check column validity
                    int out_index = out_w + w * (out_h + h * base_index);
                    if (indexes[out_index] == index) {
                        d += delta[out_index];
                    }
                }
            }
        }
    }

    // Avoid atomic operation by assuming unique writers to each prev_delta[index]
    prev_delta[index] += d;
}