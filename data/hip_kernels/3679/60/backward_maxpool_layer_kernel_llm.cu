#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Calculate the output dimensions
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int area = (size - 1) / stride;
    int pad_half = pad / 2;

    // Compute unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Determine position in input tensor
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    // Initialize accumulation variable
    float d = 0;

    // Use loop unrolling for optimization
    #pragma unroll
    for (int l = -area; l <= area; ++l) {
        int out_h = (i - pad_half) / stride + l;
        if (out_h < 0 || out_h >= h) continue;

        #pragma unroll
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - pad_half) / stride + m;
            if (out_w < 0 || out_w >= w) continue;

            // Compute output index
            int out_index = out_w + w * (out_h + h * (k + in_c * b));

            // Accumulate delta where index matches
            if (indexes[out_index] == id) {
                d += delta[out_index];
            }
        }
    }

    // Update prev_delta with accumulated values
    prev_delta[b * in_c * in_h * in_w + k * in_h * in_w + i * in_w + j] += d;
}