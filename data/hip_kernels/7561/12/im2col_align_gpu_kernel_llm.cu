#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void im2col_align_gpu_kernel(const int n, const float* data_im, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_col, const int bit_align)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = blockDim.x * gridDim.x;

    for (; index < n; index += total_threads) {  // Reduced register pressure by using total_threads
        int w_out = index % width_col;
        int h_index = index / width_col;
        int h_out = h_index % height_col;
        int channel_in = h_index / height_col;
        int channel_out = channel_in * ksize * ksize;
        int h_in = h_out * stride - pad;
        int w_in = w_out * stride - pad;

        float* data_col_ptr = &data_col[channel_out * bit_align + h_out * width_col + w_out];
        const float* data_im_ptr = data_im + (channel_in * height + h_in) * width + w_in;

        for (int i = 0; i < ksize; ++i) {
            for (int j = 0; j < ksize; ++j) {
                int h = h_in + i;
                int w = w_in + j;

                float val = (h >= 0 && w >= 0 && h < height && w < width) ? data_im_ptr[i * width + j] : 0;

                int pre_out_index = index % (width_col * height_col);
                int out_index = (channel_out + i * ksize + j) * bit_align + pre_out_index;
                data_col[out_index] = val;

                data_col_ptr += bit_align;  // Improved data memory offset calculation
            }
        }
    }
}