#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + pad - size)/stride + 1;
    int w = (in_w + pad - size)/stride + 1;
    int c = in_c;

    // Use threadIdx.x to assign unique thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int b = id / (w * h * c);
    int k = (id / (w * h)) % c;
    int i = (id / w) % h;
    int j = id % w;

    int w_offset = -pad/2;
    int h_offset = -pad/2;

    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;
    int index, cur_h, cur_w;

    // Unroll loops for better performance
    #pragma unroll
    for (int l = 0; l < size; ++l) {
        #pragma unroll
        for (int m = 0; m < size; ++m) {
            cur_h = h_offset + i * stride + l;
            cur_w = w_offset + j * stride + m;
            index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            bool valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float val = (valid) ? input[index] : -INFINITY;
            if (val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    
    output[out_index] = max;
    indexes[out_index] = max_i;
}