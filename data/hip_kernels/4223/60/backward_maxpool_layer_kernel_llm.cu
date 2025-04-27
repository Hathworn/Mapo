#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Calculate output spatial dimensions
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int area = (size - 1) / stride;

    // Calculate the unique global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    // Compute initial positions and offsets
    int j = index % in_w;
    int i = (index / in_w) % in_h;
    int k = (index / (in_w * in_h)) % in_c;
    int b = index / (in_w * in_h * in_c);

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0;
    
    // Precompute stride-based output position for the center element
    int center_out_w = (j - w_offset) / stride;
    int center_out_h = (i - h_offset) / stride;

    // Loop through the receptive field
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = center_out_w + m;
            int out_h = center_out_h + l;

            // Check valid output positions
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                int out_index = out_w + w * (out_h + h * (k + c * b));
                if (indexes[out_index] == index) {
                    // Aggregate contributions from delta if the index matches
                    d += delta[out_index];
                }
            }
        }
    }

    // Update the prev_delta
    prev_delta[index] += d;
}