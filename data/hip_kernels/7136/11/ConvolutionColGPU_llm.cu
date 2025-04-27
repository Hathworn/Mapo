#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ConvolutionColGPU(float *d_Dst, float *d_Src, float *d_Filter, int filterR) {
    int x = threadIdx.x;
    int y = threadIdx.y;

    float sum = 0;

    // Unroll loop for better performance, assuming filterR is small and known at compile time.
    for (int k = -filterR; k <= filterR; k++) { 
        int d = y + k;
        // Use constant memory for d_Filter if applicable, else assume d_Filter is cached
        if (d >= 0 && d < blockDim.y) {
            sum += d_Src[d * blockDim.x + x] * d_Filter[filterR - k]; 
        }
    }

    // Write once to global memory
    d_Dst[y * blockDim.x + x] = sum;
}