#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    int b = id / in_c; // Simplified calculation for b

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0;
    int out_w, out_h, out_index, valid;
    #pragma unroll // Unroll loop for potential performance gain
    for (int l = -area; l < area + 1; ++l) {
        #pragma unroll // Unroll loop for potential performance gain
        for (int m = -area; m < area + 1; ++m) {
            out_w = (j - w_offset) / stride + m;
            out_h = (i - h_offset) / stride + l;
            out_index = out_w + w * (out_h + h * (k + c * b));
            
            valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);
            d += (valid && indexes[out_index] == (b * in_c * in_h * in_w + k * in_h * in_w + i * in_w + j)) ? delta[out_index] : 0;
        }
    }
    prev_delta[b * in_c * in_h * in_w + k * in_h * in_w + i * in_w + j] += d; // Simplified index calculation
}