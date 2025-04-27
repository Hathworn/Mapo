#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void im2col_nopad_kernel(float *im, int channels,  int height,  int width, int ksize,  int stride, float *data_col)
{
    // Calculate total number of threads and current thread index.
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate output dimensions for the col matrix.
    int height_col = (height - ksize) / stride + 1;
    int width_col = (width - ksize) / stride + 1;
    int channels_col = channels * ksize * ksize;
    
    // Compute the size of the column matrix once.
    int col_size = height_col * width_col * channels_col;
    
    // Exit if the current thread is beyond the col matrix bounds.
    if (id >= col_size) return;
    
    // Calculate indices for width, height, and channel.
    int col_index = id;
    int w = col_index % width_col;
    col_index /= width_col;
    int h = col_index % height_col;
    col_index /= height_col;
    int c = col_index % channels_col;
    
    // Precompute offsets and indices for efficient memory access.
    int w_offset = c % ksize;
    int h_offset = (c / ksize) % ksize;
    int im_channel = c / (ksize * ksize);
    int im_row = h_offset + h * stride;
    int im_col = w_offset + w * stride;
    
    // Use a conditional operator to determine the value to store.
    float val = (im_row >= 0 && im_col >= 0 && im_row < height && im_col < width) ? 
                im[im_col + width * (im_row + height * im_channel)] : 0.0f;
    
    data_col[id] = val;
}