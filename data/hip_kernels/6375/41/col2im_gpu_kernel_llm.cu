#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void col2im_gpu_kernel(const int n, const float* data_col, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_im) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int num_threads = blockDim.x * gridDim.x;
    
    // Loop unrolling and handling multiple elements per thread
    for (; index < n; index += num_threads) {
        float val = 0;
        int w = index % width + pad;
        int h = (index / width) % height + pad;
        int c = index / (width * height);

        // Calculate output boundaries
        int w_col_start = max(0, (w < ksize) ? 0 : (w - ksize) / stride + 1);
        int w_col_end = min(w / stride + 1, width_col);
        int h_col_start = max(0, (h < ksize) ? 0 : (h - ksize) / stride + 1);
        int h_col_end = min(h / stride + 1, height_col);

        // Precompute offsets outside the loop
        int offset_base = (c * ksize * ksize + h * ksize + w) * height_col * width_col;
        int coeff_h_col = (1 - stride * ksize * height_col) * width_col;
        int coeff_w_col = (1 - stride * height_col * width_col);

        // Use shared memory (if applicable) to reduce memory latency
        for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
            #pragma unroll // Unroll the inner loop for increased ILP
            for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
                val += data_col[offset_base + h_col * coeff_h_col + w_col * coeff_w_col];
            }
        }
        data_im[index] += val;
    }
}