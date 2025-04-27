```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ConvolutionRowGPU(double *d_Dst, double *d_Src, double *d_Filter, int imageW, int imageH, int filterR) {
    // Use shared memory to reduce global memory access
    extern __shared__ double shared_Src[];

    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int local_col = threadIdx.x;

    // Load data into shared memory
    if (row < imageH && local_col < imageW) {
        shared_Src[local_col] = d_Src[row * imageW + col];
    }
    __syncthreads(); // Ensure all threads have loaded data into shared memory

    double sum = 0;

    // Perform convolution using shared memory
    for (int k = -filterR; k <= filterR; k++) {
        int d = col + k;

        if (d >= 0 && d < imageW) {
            // Access the shared_Src for faster memory access
            sum += shared_Src[local_col + k] * d_Filter[filterR - k];
        }
    }

    // Write the result to global memory
    if (row < imageH && col < imageW) {
        d_Dst[row * imageW + col] = sum;
    }
}