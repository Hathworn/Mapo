#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void im2col_gpu_kernel(const int n, const float* data_im, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_col) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Process multiple elements per thread to reduce total iterations
    int step = blockDim.x * gridDim.x;
    for (; index < n; index += step) {
        int w_out = index % width_col;
        int h_index = index / width_col;
        int h_out = h_index % height_col;
        int channel_in = h_index / height_col;
        int channel_out = channel_in * ksize * ksize;

        // Pre-calculate common terms
        int h_in_origin = h_out * stride - pad;
        int w_in_origin = w_out * stride - pad;

        float* data_col_ptr = data_col + (channel_out * height_col + h_out) * width_col + w_out;
        const float* data_im_ptr = data_im + channel_in * height * width;

        for (int i = 0; i < ksize; ++i) {
            for (int j = 0; j < ksize; ++j) {
                int h = h_in_origin + i;
                int w = w_in_origin + j;

                // Use ternary operator to select proper value
                *data_col_ptr = (h >= 0 && w >= 0 && h < height && w < width) ?
                                data_im_ptr[h * width + w] : 0;

                data_col_ptr += height_col * width_col;
            }
        }
    }
}