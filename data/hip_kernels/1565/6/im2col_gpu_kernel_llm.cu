#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void im2col_gpu_kernel(const int n, const float* data_im, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_col) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index < n) { // Ensure threads operate within bounds
        // Calculate indices and offsets
        int w_out = index % width_col;
        int h_index = index / width_col;
        int h_out = h_index % height_col;
        int channel_in = h_index / height_col;
        int channel_out = channel_in * ksize * ksize;
        int h_in = h_out * stride - pad;
        int w_in = w_out * stride - pad;

        // Pointers to data_col and data_im
        float* data_col_ptr = data_col + (channel_out * height_col + h_out) * width_col + w_out;
        const float* data_im_ptr = data_im + (channel_in * height + h_in) * width + w_in;

        // Nested loops unrolled
        for (int i = 0; i < ksize; ++i) {
            for (int j = 0; j < ksize; ++j) {
                int h = h_in + i;
                int w = w_in + j;
                *data_col_ptr = (h >= 0 && w >= 0 && h < height && w < width) ?
                                data_im_ptr[i * width + j] : 0;
                data_col_ptr += height_col * width_col;
            }
        }
    }
}
```
