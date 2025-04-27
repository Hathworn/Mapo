#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionRowGPU(float *d_Dst, float *d_Src, float *d_Filter, int imageW, int imageH, int filterR) {
    // Calculate global thread position for row and column
    int row = blockDim.y * blockIdx.y + threadIdx.y + filterR;
    int col = blockDim.x * blockIdx.x + threadIdx.x + filterR;
    int newImageW = imageW + filterR * 2;

    float sum = 0.0f;

    // Unrolling the loop to improve performance
    #pragma unroll
    for (int k = -filterR; k <= filterR; k++) {
        int d = col + k;
        sum += d_Src[row * newImageW + d] * d_Filter[filterR - k];
    }

    // Write the result to global memory
    d_Dst[row * newImageW + col] = sum;
}