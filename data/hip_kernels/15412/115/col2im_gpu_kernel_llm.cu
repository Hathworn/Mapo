```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void col2im_gpu_kernel(const int n, const float* data_col, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_im) {
    // Precompute indices outside the loop
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;

    for (; index < n; index += gridStride) {
        float val = 0;
        
        // Calculate padded coordinates
        int w = index % width + pad;
        int h = (index / width) % height + pad;
        int c = index / (width * height);
        
        // Precompute common expressions
        int w_stride = w / stride;
        int h_stride = h / stride;
        
        // Calculate start and end positions
        int w_col_start = max((w < ksize) ? 0 : (w - ksize) / stride + 1, 0);
        int w_col_end = min(w_stride + 1, width_col);
        int h_col_start = max((h < ksize) ? 0 : (h - ksize) / stride + 1, 0);
        int h_col_end = min(h_stride + 1, height_col);
        
        // Calculate offsets and coefficients
        int offset = (c * ksize * ksize + h * ksize + w) * height_col * width_col;
        int coeff_h_col = (1 - stride * ksize * height_col) * width_col;
        int coeff_w_col = (1 - stride * height_col * width_col);

        // Inner loop unrolling to enhance parallelism
        for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
            int h_offset = h_col * coeff_h_col;
            
            for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
                int w_offset = w_col * coeff_w_col;
                val += data_col[offset + h_offset + w_offset];
            }
        }
        
        // Increment output value
        data_im[index] += val;
    }
}