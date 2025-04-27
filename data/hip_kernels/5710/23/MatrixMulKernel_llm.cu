#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float* Md, float* Nd, float* Pd, int ncols) {
    // Calculate the row and column indices for the current thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize the output element to zero
    float Pvalue = 0;

    // Ensure thread is within matrix bounds
    if (row < ncols && col < ncols) {
        // Compute the matrix multiplication result for the thread's position
        for (int k = 0; k < ncols; k++) {
            Pvalue += Md[row * ncols + k] * Nd[k * ncols + col];
        }
        // Store the result in the output matrix
        Pd[row * ncols + col] = Pvalue;
    }
}