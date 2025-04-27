#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ConvolutionColGPU(float *d_Dst, float *d_Src, float *d_Filter, int imageW, int imageH, int filterR) {
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;

    if (col < imageW && row < imageH) { // Boundary check for active threads
        float sum = 0;
        for (int k = -filterR; k <= filterR; k++) {
            int d = row + k;
            if (d >= 0 && d < imageH) { // Correct boundary condition
                sum += d_Src[col + imageW * d] * d_Filter[filterR - k];
            }
        }
        d_Dst[row * imageW + col] = sum;
    }
}