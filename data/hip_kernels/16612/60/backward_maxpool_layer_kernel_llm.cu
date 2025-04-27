#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int area = (size - 1) / stride;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return; // Terminate if id exceeds n

    int index = id;
    int j = index % in_w;
    int i = (index / in_w) % in_h;
    int k = (index / (in_w * in_h)) % in_c;
    int b = index / (in_w * in_h * in_c);

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    float d = 0;
    // Combine area loops to reduce condition checks
    for (int l = 0; l <= size - stride; l += stride) {
        for (int m = 0; m <= size - stride; m += stride) {
            int out_w = (j - w_offset + m) / stride;
            int out_h = (i - h_offset + l) / stride;
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) {
                int out_index = out_w + w * (out_h + h * (k + in_c * b));
                if (indexes[out_index] == index) {
                    d += delta[out_index];
                }
            }
        }
    }
    prev_delta[index] += d; // Update prev_delta
}