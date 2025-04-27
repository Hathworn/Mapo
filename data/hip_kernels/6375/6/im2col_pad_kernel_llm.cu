```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void im2col_pad_kernel(float *im, int channels, int height, int width, int ksize, int stride, float *data_col)
{
    int height_col = 1 + (height - 1) / stride;
    int width_col = 1 + (width - 1) / stride;
    int channels_col = channels * ksize * ksize;

    int pad = ksize / 2;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride_grid = gridDim.x * blockDim.x; // Calculate grid stride

    for (; id < height_col * width_col * channels_col; id += stride_grid) { // Loop through stride
        int col_index = id;
        int w = id % width_col;
        id /= width_col;
        int h = id % height_col;
        id /= height_col;
        int c = id % channels_col;

        int w_offset = c % ksize;
        int h_offset = (c / ksize) % ksize;
        int im_channel = c / ksize / ksize;
        int im_row = h_offset + h * stride - pad;
        int im_col = w_offset + w * stride - pad;

        // Use conditional operator to ensure bounds
        data_col[col_index] = (im_row >= 0 && im_col >= 0 && im_row < height && im_col < width) 
            ? im[im_col + width * (im_row + height * im_channel)] 
            : 0.0f;
    }
}