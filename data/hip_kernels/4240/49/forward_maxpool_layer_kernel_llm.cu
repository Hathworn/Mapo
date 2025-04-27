```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;
    
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;
    
    int out_index = id;
    int j = out_index % w;
    out_index /= w;
    int i = out_index % h;
    out_index /= h;
    int k = out_index % c;
    int b = out_index / c;
    
    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float max = -INFINITY;
    int max_i = -1;

    // Optimize loop bounds for better register use
    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride + l;
            int cur_w = w_offset + j * stride + m;
            
            if (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w) { // Directly check validity
                int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
                float val = input[index];
                
                if (val > max) {
                    max = val;
                    max_i = index;
                }
            }
        }
    }
    
    output[id] = max;  // Simplified the output indexing by using id
    indexes[id] = max_i;
}