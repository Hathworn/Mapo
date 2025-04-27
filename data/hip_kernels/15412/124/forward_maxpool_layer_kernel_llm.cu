#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride_x, int stride_y, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate output dimensions
    int h = (in_h + pad - size) / stride_y + 1;
    int w = (in_w + pad - size) / stride_x + 1;

    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Compute output indices
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % in_c;
    int b = id / (w * h * in_c);

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    int out_index = j + w * (i + h * (k + in_c * b));
    float max_val = -INFINITY;
    int max_idx = -1;

    // Unroll loops for better performance
    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride_y + l;
            int cur_w = w_offset + j * stride_x + m;

            // Only consider valid indices
            bool valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            if (valid) {
                int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
                float val = input[index];
                if (val > max_val) {
                    max_val = val;
                    max_idx = index;
                }
            }
        }
    }

    output[out_index] = max_val;
    if (indexes) indexes[out_index] = max_idx;
}