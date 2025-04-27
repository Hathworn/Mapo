#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void col2im_gpu_kernel(const int n, const float* data_col, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_im) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = blockDim.x * gridDim.x;

    while (index < n) {
        float val = 0;
        int w = index % width + pad;
        int h = (index / width) % height + pad;
        int c = index / (width * height);

        // Pre-calculate reusable values
        int w_stride = w / stride;
        int h_stride = h / stride;
        int ksize_stride = ksize / stride;

        // Start and end for columns
        int w_col_start = max(0, (w - ksize) / stride + 1);
        int w_col_end = min(w_stride + 1, width_col);
        int h_col_start = max(0, (h - ksize) / stride + 1);
        int h_col_end = min(h_stride + 1, height_col);

        // Offset and coeffs for optimized memory access
        int offset = (c * ksize * ksize + h * ksize + w) * height_col * width_col;
        int coeff_h_col = stride * width_col - stride * ksize * height_col * width_col;
        int coeff_w_col = height_col * stride * width_col - stride;

        // Loop through relevant columns in shared memory
        for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
            for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
                val += data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
            }
        }
        data_im[index] += val;

        index += total_threads; // Advance to the next index for this thread
    }
}