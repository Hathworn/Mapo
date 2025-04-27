#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_local_avgpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride_x, int stride_y, int size, int pad, float *input, float *output)
{
    int h = (in_h + pad - size) / stride_y + 1;
    int w = (in_w + pad - size) / stride_x + 1;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int b = id / (c * h * w);
    int k = (id / (h * w)) % c;
    int i = (id / w) % h;
    int j = id % w;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    int out_index = j + w * (i + h * (k + c * b));
    float avg = 0.0f;
    int counter = 0;

    // Unroll loops to increase memory coalescing
    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + i * stride_y + l;
        if (cur_h >= 0 && cur_h < in_h) {
            for (int m = 0; m < size; ++m) {
                int cur_w = w_offset + j * stride_x + m;
                if (cur_w >= 0 && cur_w < in_w) {
                    int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
                    avg += input[index];
                    ++counter;
                }
            }
        }
    }
    
    output[out_index] = (counter > 0) ? avg / counter : 0.0f;  // Handle edge case
}