#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate the output dimensions
    int h = (in_h + pad - size)/stride + 1;
    int w = (in_w + pad - size)/stride + 1;
    int c = in_c;

    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int b = id / (w * h * c);
    int k = (id / (w * h)) % c;
    int i = (id / w) % h;
    int j = id % w;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    // Calculate output index
    int out_index = j + w * (i + h * (k + c * b));
    
    // Initialize max values
    float max_val = -INFINITY;
    int max_idx = -1;

    // Iterate over pooling window
    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride + l;
            int cur_w = w_offset + j * stride + m;
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            
            // Check if the current position is valid
            bool valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float current_val = valid ? input[index] : -INFINITY;
            
            // Update max values
            if (current_val > max_val) {
                max_idx = index;
                max_val = current_val;
            }
        }
    }

    // Store results
    output[out_index] = max_val;
    indexes[out_index] = max_idx;
}