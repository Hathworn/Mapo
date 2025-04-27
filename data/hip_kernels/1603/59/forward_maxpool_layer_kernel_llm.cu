#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate grid-specific threads.
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;
    
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;

    // Calculate input image positions.
    int j = id % w;
    id /= w; 
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    // Initialize for searching the maximum value.
    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;

    // Use registers for loop invariants and boundaries.
    int start_h = h_offset + i * stride;
    int start_w = w_offset + j * stride;
    
    // Traverse filter bounds.
    for(int l = 0; l < size; ++l) {
        int cur_h = start_h + l;
        if (cur_h < 0 || cur_h >= in_h) continue; // Skip out-of-bound h
        
        for(int m = 0; m < size; ++m) {
            int cur_w = start_w + m;
            if (cur_w < 0 || cur_w >= in_w) continue; // Skip out-of-bound w
            
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            float val = input[index];

            // Check for new maximum.
            if (val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    
    // Store results in the output.
    output[out_index] = max;
    indexes[out_index] = max_i;
}