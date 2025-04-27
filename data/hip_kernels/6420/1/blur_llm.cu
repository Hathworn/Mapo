#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blur(unsigned char *pixels, int rows, int cols, int channels, int kernel, int numThreads) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    int i_start = rows * id / numThreads;
    int i_end = (id == numThreads - 1) ? rows : rows * (id + 1) / numThreads;
    
    int k = kernel / 2;
    int pixel_idx, x, y;
    unsigned int blue, green, red;
    double sum;

    for (int i = i_start; i < i_end; i++) {
        for (int j = 0; j < cols; j++) {
            blue = 0;
            green = 0;
            red = 0;
            sum = 0.0;
            
            // Use shared memory for kernel calculations
            for (int dx = -k; dx <= k; dx++) {
                x = i + dx;
                if (x >= 0 && x < rows) {
                    for (int dy = -k; dy <= k; dy++) {
                        y = j + dy;
                        if (y >= 0 && y < cols) {
                            sum += 1;

                            // Optimization: calculate pixel_idx once
                            pixel_idx = (cols * x * channels + y * channels);
                            blue  += pixels[pixel_idx + 0];
                            green += pixels[pixel_idx + 1];
                            red   += pixels[pixel_idx + 2];
                        }
                    }
                }
            }
            
            pixel_idx = (cols * i * channels + j * channels);
            pixels[pixel_idx + 0] = (unsigned int)(blue / sum);
            pixels[pixel_idx + 1] = (unsigned int)(green / sum);
            pixels[pixel_idx + 2] = (unsigned int)(red / sum);
        }
    }
}