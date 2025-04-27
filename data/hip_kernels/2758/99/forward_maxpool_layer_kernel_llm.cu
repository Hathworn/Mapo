#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride_x, int stride_y, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + pad - size) / stride_y + 1;
    int w = (in_w + pad - size) / stride_x + 1;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;

    // Using temp variables for commonly calculated values to reduce access time
    int input_depth_step = in_h * in_w;
    int input_batch_step = in_c * input_depth_step;

    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride_y + l;
            int cur_w = w_offset + j * stride_x + m;
            int index = cur_w + in_w * (cur_h + k * in_h + b * input_depth_step);
            int valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float val = (valid != 0) ? input[index] : -INFINITY;

            // Using ternary operation to simplify the max comparison and update
            if (val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    output[out_index] = max;
    indexes[out_index] = max_i;
}