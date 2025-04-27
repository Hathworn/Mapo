#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride_x, int stride_y, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + pad - size) / stride_y + 1;
    int w = (in_w + pad - size) / stride_x + 1;
    int c = in_c;
    int area_x = (size - 1) / stride_x;
    int area_y = (size - 1) / stride_y;

    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (id >= n) return;
    
    int temp_id = id;
    int j = temp_id % in_w;
    temp_id /= in_w;
    int i = temp_id % in_h;
    temp_id /= in_h;
    int k = temp_id % in_c;
    temp_id /= in_c;
    int b = temp_id;
    
    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float d = 0;
    for (int l = -area_y; l <= area_y; ++l) { // Combine initialization and check
        for (int m = -area_x; m <= area_x; ++m) { // Combine initialization and check
            int out_w = (j - w_offset) / stride_x + m;
            int out_h = (i - h_offset) / stride_y + l;
            int out_index = out_w + w * (out_h + h * (k + c * b));
            bool valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);
            d += (valid && indexes[out_index] == id) ? delta[out_index] : 0;
        }
    }
    prev_delta[id] += d; // Use id rather than index for clarity
}