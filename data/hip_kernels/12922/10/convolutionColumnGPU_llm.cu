#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionColumnGPU(double *h_Dst, double *h_Src, double *h_Filter, int imageW, int imageH, int filterR) {
    // Calculate global row and column indices
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    if (ix >= imageW || iy >= imageH) return; // Boundary check

    double sum = 0;
    
    // Loop with optimized memory access
    for (int k = -filterR; k <= filterR; k++) {
        int d = iy + k;
        if (d >= 0 && d < imageH) {
            sum += h_Src[d * imageW + ix] * h_Filter[filterR - k];
        }
    }
    
    h_Dst[iy * imageW + ix] = sum; // Write result to global memory after the loop
}