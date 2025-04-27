#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + 2*pad) / stride;
    int w = (in_w + 2*pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    int j = index % in_w;
    int i = (index / in_w) % in_h;
    int k = (index / (in_w * in_h)) % in_c;
    int b = index / (in_w * in_h * in_c);

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0;
    int j_start = max(0, ((j - w_offset) / stride) - area);
    int j_end = min(w - 1, ((j - w_offset) / stride) + area);
    int i_start = max(0, ((i - h_offset) / stride) - area);
    int i_end = min(h - 1, ((i - h_offset) / stride) + area);

    // Iterate over possible pooling window
    #pragma unroll
    for(int l = i_start; l <= i_end; ++l) {
        #pragma unroll
        for(int m = j_start; m <= j_end; ++m) {
            int out_index = m + w * (l + h * (k + c * b));
            d += (indexes[out_index] == index) ? delta[out_index] : 0;
        }
    }
    prev_delta[index] += d;
}