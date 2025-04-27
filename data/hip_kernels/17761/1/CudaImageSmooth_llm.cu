#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CudaImageSmooth(unsigned char *In, unsigned char *Out, int width, int height, int fsize)
{
    // Calculate column and row indices with block and thread info
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure col and row are within valid range
    if (col >= width || row >= height) return;
    
    // Calculate destination index
    int destIndex = row * width + col;

    // Initialize accumulator for smoothing
    float tmp = 0.0f;
    
    // Check boundary conditions
    if (col < fsize / 2 || col > width - fsize / 2 || row < fsize / 2 || row > height - fsize / 2) {
        Out[destIndex] = 0;
    } else {
        // Compute average pixel value within filter window
        for (int frow = -fsize / 2; frow <= fsize / 2; frow++) {
            for (int fcol = -fsize / 2; fcol <= fsize / 2; fcol++) {
                // Accumulate pixel values
                tmp += static_cast<float>(In[(row + frow) * width + (col + fcol)]);
            }
        }
        // Normalize by filter size to get average
        tmp /= (fsize * fsize);
        Out[destIndex] = static_cast<unsigned char>(tmp);
    }
}