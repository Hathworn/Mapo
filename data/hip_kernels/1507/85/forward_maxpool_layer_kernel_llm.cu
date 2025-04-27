#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;

    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;

    // Use registers for loop bounds for efficiency
    #pragma unroll
    for (int l = 0; l < size; ++l) {
        // Precompute h offset for current l iteration
        int cur_h = h_offset + i * stride + l;
        if (cur_h < 0 || cur_h >= in_h) continue;  // Skip invalid rows

        #pragma unroll
        for (int m = 0; m < size; ++m) {
            int cur_w = w_offset + j * stride + m;
            if (cur_w < 0 || cur_w >= in_w) continue;  // Skip invalid columns

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