#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate the indexes in a coalesced manner
    int j = id % in_w;
    int i = (id / in_w) % in_h;
    int k = (id / (in_w * in_h)) % in_c;
    int b = id / (in_w * in_h * in_c);

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0.0f;
    int l, m;

    #pragma unroll
    for (l = -area; l <= area; ++l) {
        #pragma unroll
        for (m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            int out_index = out_w + w * (out_h + h * (k + c * b));
            bool valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);
            // Accumulate delta value if conditions are met
            d += (valid && indexes[out_index] == id) ? delta[out_index] : 0.0f;
        }
    }
    prev_delta[id] += d;  // Update the previous delta
}