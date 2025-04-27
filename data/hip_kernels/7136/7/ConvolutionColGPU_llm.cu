#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized ConvolutionColGPU kernel
__global__ void ConvolutionColGPU(double *d_Dst, double *d_Src, double *d_Filter, int imageW, int imageH, int filterR) {
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;

    // Return immediately if row or col is out of bounds
    if (row >= imageH || col >= imageW) return;

    double sum = 0.0;
    for (int k = -filterR; k <= filterR; k++) {
        int d = row + k;
        // Check if the index is within bounds
        if (d >= 0 && d < imageH) { // Correct imageH instead of imageW
            sum += d_Src[col + imageW * d] * d_Filter[filterR - k];
        }
    }
    // Store the result in the output array
    d_Dst[row * imageW + col] = sum;
}