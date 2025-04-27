#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Compute output dimensions
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;
    int area = (size - 1) / stride;

    // Calculate the thread id
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Decompose the id into indexes for batch, channel, height, width
    int index = id;
    int j = index % in_w;
    index /= in_w;
    int i = index % in_h;
    index /= in_h;
    int k = index % in_c;
    index /= in_c;
    int b = index;

    // Precalculate offsets for padding
    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    // Initialize delta to zero for accumulation
    float d = 0;

    // Loop over the pooling area
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            // Compute output width and height indices
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            int out_index = out_w + w * (out_h + h * (k + c * b));

            // Calculate if the output position is valid
            bool valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);

            // Accumulate delta if the condition matches
            if (valid && indexes[out_index] == id)
                d += delta[out_index];
        }
    }
    // Update prev_delta
    prev_delta[id] += d;
}