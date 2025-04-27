#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Compute dimensions for the output
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;

    // Calculate global index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Determine locations in output tensor
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    // Offset values for padding
    int w_offset = -pad;
    int h_offset = -pad;

    // Calculate output index
    int out_index = j + w * (i + h * (k + c * b));
    
    // Initialize max value to negative infinity
    float max = -INFINITY;
    int max_i = -1;

    // Iterate over window to find maximum value
    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride + l;
            int cur_w = w_offset + j * stride + m;
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));

            // Check if current position is within input bounds
            if (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w) {
                float val = input[index];
                if (val > max) {
                    max = val;
                    max_i = index;
                }
            }
        }
    }

    // Assign results to output and indexes
    output[out_index] = max;
    indexes[out_index] = max_i;
}