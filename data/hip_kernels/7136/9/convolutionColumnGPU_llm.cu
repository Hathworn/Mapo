#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionColumnGPU(float *d_Dst, float *d_Src, float *d_Filter, int imageW, int imageH, int filterR) {
    // Shared memory to store source data
    extern __shared__ float s_Src[];

    // Calculate new image width with padding
    int newImageW = imageW + filterR * 2;

    // Compute global row and col index
    int globalRow = blockDim.y * blockIdx.y + threadIdx.y;
    int globalCol = blockDim.x * blockIdx.x + threadIdx.x;

    // Load data into shared memory with halo region
    int sharedRow = threadIdx.y + filterR;
    int sharedCol = threadIdx.x + filterR;
    s_Src[sharedRow * blockDim.x + sharedCol] = d_Src[(globalRow + filterR) * newImageW + globalCol + filterR];

    // Load halo above
    if (threadIdx.y < filterR) {
        s_Src[threadIdx.y * blockDim.x + sharedCol] = d_Src[(globalRow + threadIdx.y) * newImageW + globalCol + filterR];
    }

    // Load halo below
    if (threadIdx.y >= blockDim.y - filterR) {
        s_Src[(threadIdx.y + 2 * filterR) * blockDim.x + sharedCol] = d_Src[(globalRow + 2 * filterR + threadIdx.y) * newImageW + globalCol + filterR];
    }

    // Synchronize to ensure all loads are complete
    __syncthreads();

    // Perform convolution
    float sum = 0;
    for (int k = -filterR; k <= filterR; k++) {
        sum += s_Src[(sharedRow + k) * blockDim.x + sharedCol] * d_Filter[filterR - k];
    }

    // Write result to global memory
    d_Dst[(globalRow + filterR) * newImageW + globalCol + filterR] = sum;
}