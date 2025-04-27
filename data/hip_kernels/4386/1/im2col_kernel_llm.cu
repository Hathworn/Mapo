#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void im2col_kernel(int n, float* data_im, int height, int width, int ksize_h, int ksize_w, int pad_h, int pad_w, int stride_h, int stride_w, int dilation_h, int dilation_w, int height_col, int width_col, float* data_col) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = blockDim.x * gridDim.x;
    while (index < n) {
        // Calculate output dimensions
        int w_out = index % width_col;
        int h_out = (index / width_col) % height_col;
        int channel_in = index / (width_col * height_col);
        int channel_out = channel_in * ksize_h * ksize_w;
        
        // Calculate input dimensions
        int h_in = h_out * stride_h - pad_h;
        int w_in = w_out * stride_w - pad_w;
        
        // Initialize pointers
        float* data_col_ptr = data_col + (channel_out * height_col + h_out) * width_col + w_out;
        float* data_im_ptr = data_im + (channel_in * height + h_in) * width + w_in;
        
        // Iterate over the kernel size
        for (int i = 0; i < ksize_h; ++i) {
            for (int j = 0; j < ksize_w; ++j) {
                // Calculate input position
                int h = h_in + i * dilation_h;
                int w = w_in + j * dilation_w;
                
                // Conditional assignment to avoid out-of-bound access
                *data_col_ptr = (h >= 0 && w >= 0 && h < height && w < width) ?
                                data_im_ptr[i * dilation_h * width + j * dilation_w] : 0;
                
                // Move to the next position in the output
                data_col_ptr += height_col * width_col;
            }
        }
        
        // Move to the next index handled by the thread
        index += total_threads;
    }
}