#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void col2im_gpu_kernel(const int n, const float* data_col, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_im) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = blockDim.x * gridDim.x; // Precompute total threads

    // Looping through all elements with stride
    for (int i = index; i < n; i += total_threads) {
        float val = 0;
        int w = i % width + pad;
        int h = (i / width) % height + pad;
        int c = i / (width * height);

        // Precompute these values outside the inner loops
        int w_col_start = max(0, (w - ksize) / stride + 1);
        int w_col_end = min(w / stride + 1, width_col);
        int h_col_start = max(0, (h - ksize) / stride + 1);
        int h_col_end = min(h / stride + 1, height_col);
        
        int offset = (c * ksize * ksize + h * ksize + w) * height_col * width_col;
        int coeff_h_col = (1 - stride * ksize * height_col) * width_col;
        int coeff_w_col = (1 - stride * height_col * width_col);

        // Use a single loop for simplicity and potential unrolling
        for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
            for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
                int col_index = offset + h_col * coeff_h_col + w_col * coeff_w_col;
                val += data_col[col_index];
            }
        }
        data_im[i] += val;
    }
}