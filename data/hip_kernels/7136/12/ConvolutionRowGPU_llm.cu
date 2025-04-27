#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ConvolutionRowGPU(float *d_Dst, float *d_Src, float *d_Filter, int imageW, int imageH, int filterR) {
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    float sum = 0;

    // Loop unrolling optimization
    #pragma unroll
    for (int k = -filterR; k <= filterR; k++) {
        int d = col + k;
        if (d >= 0 && d < imageW) {
            sum += d_Src[row * imageW + d] * d_Filter[filterR - k];
        }
    }

    // Ensure that the calculated value is inside the image boundary
    if (col < imageW && row < imageH) {
        d_Dst[row * imageW + col] = sum;
    }
}