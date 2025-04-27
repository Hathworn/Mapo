#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate output dimensions
    int h = (in_h + 2*pad) / stride;
    int w = (in_w + 2*pad) / stride;
    
    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Derive indices for batch, channel, height, and width
    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    // Calculate padding offsets
    int w_offset = -pad;
    int h_offset = -pad;

    // Initialize output index and max values
    int out_index = j + w * (i + h * (k + in_c * b));
    float max_val = -INFINITY;
    int max_index = -1;

    // Loop unrolling to improve performance
    #pragma unroll
    for (int l = 0; l < size; ++l) {
        #pragma unroll
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride + l;
            int cur_w = w_offset + j * stride + m;
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            int valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float val = valid ? input[index] : -INFINITY;

            // Update max value and index
            if (val > max_val) {
                max_val = val;
                max_index = index;
            }
        }
    }

    // Assign output values
    output[out_index] = max_val;
    indexes[out_index] = max_index;
}