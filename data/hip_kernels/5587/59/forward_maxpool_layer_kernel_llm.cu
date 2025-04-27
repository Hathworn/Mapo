#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + 2*pad) / stride;
    int w = (in_w + 2*pad) / stride;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int b = id / (w * h * c);
    int k = (id / (w * h)) % c;
    int i = (id / w) % h;
    int j = id % w;

    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;
    int w_offset = -pad + j * stride;
    int h_offset = -pad + i * stride;

    // Loop unrolling for smaller `size` and precompute offsets
    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + l;
        if (cur_h < 0 || cur_h >= in_h) continue;
        for (int m = 0; m < size; ++m) {
            int cur_w = w_offset + m;
            if (cur_w < 0 || cur_w >= in_w) continue;
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            float val = input[index];
            if (val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    output[out_index] = max;
    indexes[out_index] = max_i;
}