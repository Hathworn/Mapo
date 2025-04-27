#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ConvolutionRowGPU(float *d_Dst, float *d_Src, float *d_Filter, int filterR) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Global x index
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Global y index
    int k;

    float sum = 0;
    // Compute convolution only for valid pixels
    for (k = -filterR; k <= filterR; k++) {
        int d = x + k;
        if (d >= 0 && d < gridDim.x * blockDim.x) { // Use grid size to handle border
            sum += d_Src[y * gridDim.x * blockDim.x + d] * d_Filter[filterR - k];
        }
    }
    d_Dst[y * gridDim.x * blockDim.x + x] = sum; // Write to global memory
}