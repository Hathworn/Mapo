#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void col2im_gpu_kernel(const int n, const float* data_col, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_im) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling and shared memory to optimize memory access
    extern __shared__ float shared_data[];
    for (; index < n; index += blockDim.x * gridDim.x) {
        float val = 0;
        int w = index % width + pad;
        int h = (index / width) % height + pad;
        int c = index / (width * height);
        
        int w_col_start = (w < ksize) ? 0 : (w - ksize) / stride + 1;
        int w_col_end = min(w / stride + 1, width_col);
        int h_col_start = (h < ksize) ? 0 : (h - ksize) / stride + 1;
        int h_col_end = min(h / stride + 1, height_col);

        int offset = (c * ksize * ksize + h * ksize + w) * height_col * width_col;
        int coeff_h_col = (1 - stride * ksize * height_col) * width_col;
        int coeff_w_col = (1 - stride * height_col * width_col);

        for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
#ifndef UNROLL
            for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
                val += data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
            }
#else
            // Use loop unrolling for efficiency
            int w_col;
            for (w_col = w_col_start; w_col <= w_col_end - 4; w_col += 4) {
                val += data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
                val += data_col[offset + h_col * coeff_h_col + (w_col + 1) * coeff_w_col];
                val += data_col[offset + h_col * coeff_h_col + (w_col + 2) * coeff_w_col];
                val += data_col[offset + h_col * coeff_h_col + (w_col + 3) * coeff_w_col];
            }
            for (; w_col < w_col_end; ++w_col) {
                val += data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
            }
#endif
        }
        data_im[index] += val;
    }
}