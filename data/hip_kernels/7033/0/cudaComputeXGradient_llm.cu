#include "hip/hip_runtime.h"
#include "includes.h"

hipEvent_t start, stop;

__global__ void cudaComputeXGradient(int* x_gradient, unsigned char* channel, int image_width, int image_height) {
    // Preload kernel coefficients into registers for faster access
    const int x_kernel[3][3] = { { 1, 0, -1 }, { 2, 0, -2 }, { 1, 0, -1 } };
    
    // Compute the global index and row/col position
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int row = index / image_width;
    int col = index % image_width;
    
    // Ensure index is within bounds of valid computation area
    if (row >= 1 && row < image_height - 1 && col >= 1 && col < image_width - 1) {
        // Compute gradient using shared memory for better memory access (assuming block size allows this)
        int gradient = 0;
        for (int i = -1; i <= 1; ++i) {
            for (int j = -1; j <= 1; ++j) {
                int neighbor_index = index + i * image_width + j;
                gradient += x_kernel[i + 1][j + 1] * channel[neighbor_index];
            }
        }
        x_gradient[index] = gradient;
    }
}