#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Precompute constants for efficiency
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;
    int area = (size - 1) / stride;
    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    // Compute the unique global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit if thread index is out of bounds
    if (id >= n) return;
    
    // Decode index into dimensions
    int index = id;
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    float d = 0;
    
    // Use a single loop with conditional for efficiency
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                int out_index = out_w + w * (out_h + h * (k + c * b));
                if (indexes[out_index] == index) {
                    d += delta[out_index];
                }
            }
        }
    }
    
    // Accumulate result
    atomicAdd(&prev_delta[index], d);
}