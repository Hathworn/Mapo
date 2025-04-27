#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with optimized looping and memory access patterns
__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Calculate 2D indexes and thread ID based on block/thread hierarchy
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    // Calculate 3D indexes based on flat thread/block IDs
    int w_offset = -pad;
    int h_offset = -pad;

    int j = index % in_w;
    int i = (index / in_w) % in_h;
    int k = (index / (in_w * in_h)) % in_c;
    int b = index / (in_w * in_h * in_c);

    // Initialize delta sum for the current index
    float d = 0.0f;

    // Calculate output dimensions
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;

    // Area for each pooling operation
    int area = (size - 1) / stride;

    // Loop through window area using register space for local indices
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;

            // Calculate flat index for output (pool-grid dimensions)
            int out_index = out_w + w * (out_h + h * (k + c * b));

            // Check if outputs are within valid grid range and accumulate valid deltas
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                if (indexes[out_index] == index) {
                    d += delta[out_index];
                }
            }
        }
    }

    // Update prev_delta with accumulated delta
    prev_delta[index] += d;
}