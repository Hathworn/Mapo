#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void im2col_nopad_kernel(float *im, int channels, int height, int width, int ksize, int stride, float *data_col)
{
    // Calculate col_size, early return if out of bounds
    int height_col = (height - ksize) / stride + 1;
    int width_col = (width - ksize) / stride + 1;
    int channels_col = channels * ksize * ksize;
    int col_size = height_col * width_col * channels_col;

    // Calculate unique global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= col_size) return;

    // Use alternative method for index calculation
    int c = id % channels_col;
    int h = (id / channels_col) % height_col;
    int w = (id / (channels_col * height_col));

    // Calculate offsets and indexes
    int w_offset = c % ksize;
    int h_offset = (c / ksize) % ksize;
    int im_channel = c / (ksize * ksize);
    int im_row = h_offset + h * stride;
    int im_col = w_offset + w * stride;

    // Check bounds and assign value
    int im_index = im_col + width * (im_row + height * im_channel);
    data_col[id] = (im_row < 0 || im_col < 0 || im_row >= height || im_col >= width) ? 0 : im[im_index];
}