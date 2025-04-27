#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_local_avgpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride_x, int stride_y, int size, int pad, float *delta, float *prev_delta)
{
    int h = (in_h + pad - size) / stride_y + 1;
    int w = (in_w + pad - size) / stride_x + 1;
    int c = in_c;
    int area_x = (size - 1) / stride_x;
    int area_y = (size - 1) / stride_y;

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return; // Ensure thread index within bounds

    int j = index % in_w;
    int i = (index / in_w) % in_h;
    int k = (index / (in_w * in_h)) % in_c;
    int b = index / (in_w * in_h * in_c);

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    int counter = 0;
    float d = 0.0f;

    // Use register memory to improve performance 
    int w_inner = w * in_h;
    int k_c = k + c * b;

    for (int l = -area_y; l <= area_y; ++l) {
        for (int m = -area_x; m <= area_x; ++m) {
            int out_w = (j - w_offset) / stride_x + m;
            int out_h = (i - h_offset) / stride_y + l;
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) { // Check valid indices
                int out_index = out_w + w * (out_h + h * k_c);
                counter++;
                d += delta[out_index];
            }
        }
    }
    if (counter > 0) prev_delta[index] += d / counter; // Aggregate results
}