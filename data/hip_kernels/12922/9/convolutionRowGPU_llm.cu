```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionRowGPU(double *h_Dst, double *h_Src, double *h_Filter, int imageW, int imageH, int filterR) {
    // Calculate global thread coordinates
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < imageW && iy < imageH) { // Ensure we are within the bounds of the image
        double sum = 0;
        int k;
        // Perform convolution
        for (k = -filterR; k <= filterR; k++) {
            int d = ix + k;
            // Check if the filter position is within image bounds
            if (d >= 0 && d < imageW) {
                sum += h_Src[iy * imageW + d] * h_Filter[filterR - k];
            }
        }
        // Write the result to the destination array
        h_Dst[iy * imageW + ix] = sum;
    }
}