```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate grid dimensions
    int h = (in_h + 2*pad) / stride;
    int w = (in_w + 2*pad) / stride;
    int c = in_c;

    // Compute unique ID for each thread
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate positions within feature map
    int out_index = id;
    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int w_offset = -pad;
    int h_offset = -pad;

    // Initialize variables for max pooling logic
    float max = -INFINITY;
    int max_i = -1;

    // Loop through pooling window
    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i * stride + l;
            int cur_w = w_offset + j * stride + m;

            // Check boundary conditions
            if (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w) {
                
                // Calculate input index within the current batch and channel
                int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));

                // Read input value and update max pooling result
                float val = input[index];
                if (val > max) {
                    max = val;
                    max_i = index;
                }
            }
        }
    }

    // Write the result to output and index arrays
    output[out_index] = max;
    indexes[out_index] = max_i;
}