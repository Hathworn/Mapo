#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes) {
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;
    
    int out_index = id;
    int j = out_index % w;
    out_index /= w;
    int i = out_index % h;
    out_index /= h;
    int k = out_index % c;
    out_index /= c;
    int b = out_index;
    
    int w_offset = -pad;
    int h_offset = -pad;
    
    float max_val = -INFINITY;
    int max_index = -1;

    // Unroll the loop to improve performance
    for(int l = 0; l < size; l++) {
        for(int m = 0; m < size; m++) {
            int cur_h = h_offset + i * stride + l;
            int cur_w = w_offset + j * stride + m;
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            int valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float val = (valid != 0) ? input[index] : -INFINITY;

            // Use conditional assignment to reduce branching
            if (val > max_val) {
                max_val = val;
                max_index = index;
            }
        }
    }
    
    output[id] = max_val;
    indexes[id] = max_index;
}