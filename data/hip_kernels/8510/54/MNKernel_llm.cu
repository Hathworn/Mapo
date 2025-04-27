#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MNKernel(int count, long *Md, long *Nd, long *Pd, int width) {
    // 2D thread ID
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to prevent out-of-bounds memory access
    if (row < count && col < width) {
        long Pvalue = 0;

        // Compute the dot product for the row and column
#pragma unroll
        for (int k = 0; k < width; k++) {
            Pvalue += Md[row * width + k] * Nd[k * width + col];
        }

        // Write the computed value to the matrix Pd only if within bounds
        Pd[row * width + col] = Pvalue;
    }
}