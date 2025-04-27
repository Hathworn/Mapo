#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCorrelate(float* source, float* kernel, float* dest, int width, int height, int kwidth, int kheight) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        float sum = 0;
        int row = i / height;
        int col = i % height;

        // Compute kernel's center offset for indexing
        int half_kwidth = kwidth / 2;
        int half_kheight = kheight / 2;

        // Iterate over kernel
        for (int w = -half_kwidth; w <= half_kwidth; ++w) {
            int current_row = row + w;
            if (current_row < 0 || current_row >= width) continue; // Skip boundary

            for (int h = -half_kheight; h <= half_kheight; ++h) {
                int current_col = col + h;
                if (current_col < 0 || current_col >= height) continue; // Skip boundary

                // Calculate source index
                int src_index = current_row * height + current_col;
                
                // Calculate kernel index
                int kernel_index = (w + half_kwidth) * kheight + (h + half_kheight);
                
                sum += source[src_index] * kernel[kernel_index];
            }
        }
        dest[i] = sum;
    }
}