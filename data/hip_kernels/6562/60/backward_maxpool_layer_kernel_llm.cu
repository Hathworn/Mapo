#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Optimized calculation of the unique thread ID
    if(id >= n) return;

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
    int area = (size - 1) / stride;

    // Use single nested loop and optimize boundary checking
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                int out_index = out_w + w * (out_h + h * (k + c * b));
                d += (indexes[out_index] == id) ? delta[out_index] : 0.0f;  // Use id instead of index directly
            }
        }
    }

    // Avoid atomic operation by accumulating in local variable first
    prev_delta[id] += d;
}