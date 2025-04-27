```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate output dimensions
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;

    // Calculate unique thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate indices
    int w_idx = id % w;
    id /= w;
    int h_idx = id % h;
    id /= h;
    int c_idx = id % in_c;
    id /= in_c;
    int b_idx = id;

    // Set initial values
    int w_offset = -pad;
    int h_offset = -pad;
    float max_val = -INFINITY;
    int max_index = -1;

    // Calculate current position
    int out_index = w_idx + w * (h_idx + h * (c_idx + in_c * b_idx));

    // Unrolled nested loops for better performance
    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + h_idx * stride + l;
        if (cur_h < 0 || cur_h >= in_h) continue; // Boundary check

        for (int m = 0; m < size; ++m) {
            int cur_w = w_offset + w_idx * stride + m;
            if (cur_w < 0 || cur_w >= in_w) continue; // Boundary check

            // Calculate the index in the input array
            int index = cur_w + in_w * (cur_h + in_h * (c_idx + b_idx * in_c));

            // Check for the maximum value
            float val = input[index];
            if (val > max_val) {
                max_val = val;
                max_index = index;
            }
        }
    }

    // Set output values
    output[out_index] = max_val;
    indexes[out_index] = max_index;
}
```
