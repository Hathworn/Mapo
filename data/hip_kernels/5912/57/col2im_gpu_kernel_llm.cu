#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void col2im_gpu_kernel(const int n, const float* data_col, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_im) {
    int index = blockIdx.x*blockDim.x+threadIdx.x;
    // Use shared memory for better performance (assumes small ksize)
    __shared__ float col_cache[256]; // Adjust size as necessary
    for(; index < n; index += blockDim.x*gridDim.x){
        float val = 0;
        int w = index % width + pad;
        int h = (index / width) % height + pad;
        int c = index / (width * height);
        
        // Compute the start and end of the output
        int w_col_start = (w < ksize) ? 0 : (w - ksize) / stride + 1;
        int w_col_end = min(w / stride + 1, width_col);
        int h_col_start = (h < ksize) ? 0 : (h - ksize) / stride + 1;
        int h_col_end = min(h / stride + 1, height_col);
        
        // Equivalent implementation using computed offsets
        int offset = (c * ksize * ksize + h * ksize + w) * height_col * width_col;
        int coeff_h_col = (1 - stride * ksize * height_col) * width_col;
        int coeff_w_col = (1 - stride * height_col * width_col);
        
        for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
            // Load into shared memory
            for (int w_col = threadIdx.x; w_col < width_col; w_col += blockDim.x) {
                col_cache[w_col] = data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
            }
            __syncthreads();
            
            for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
                val += col_cache[w_col];
            }
            __syncthreads();
        }
        data_im[index] += val;
    }
}