#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate output dimensions
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;

    // Determine overall thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Compute indexes for pooling operation
    int b = id / (w * h * c);
    int k = (id / (w * h)) % c;
    int i = (id / w) % h;
    int j = id % w;

    int w_offset = -pad;
    int h_offset = -pad;

    // Calculate output index
    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;

    // Optimize nested loop by using shared memory (hypothetical example)
    // Iterate over pooling window
    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride + l;
            int cur_w = w_offset + j * stride + m;
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            int valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float val = valid ? input[index] : -INFINITY;

            // Determine maximum value in current window
            if (val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    
    // Store result in output arrays
    output[out_index] = max;
    indexes[out_index] = max_i;
}