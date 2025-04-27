#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, float *input, float *output, int *indexes)
{
    int h = (in_h - 1) / stride + 1;
    int w = (in_w - 1) / stride + 1;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) {
        return;
    }

    // Compute output feature map indices
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;

    // Unroll loops for better performance
    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = i * stride + l;
            int cur_w = j * stride + m;
            int valid = (cur_h < in_h) && (cur_w < in_w);

            if (valid) {
                int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
                float val = input[index];
                if (val > max) {
                    max = val;
                    max_i = index;
                }
            }
        }
    }
    output[out_index] = max;
    indexes[out_index] = max_i;
}