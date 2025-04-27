#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int out_index = id;
    int b = id / (w * h * c);
    int k = (id / (w * h)) % c;
    int i = (id / w) % h;
    int j = id % w;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float max = -INFINITY;
    int max_i = -1;

    // Optimize by using a single loop for iterating through the window
    for (int l = 0; l < size * size; ++l) {
        int x_offset = l % size;
        int y_offset = l / size;
        int cur_h = h_offset + i * stride + y_offset;
        int cur_w = w_offset + j * stride + x_offset;
        if (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w) {
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