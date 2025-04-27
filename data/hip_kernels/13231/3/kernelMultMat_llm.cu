#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelMultMat(double *d_a, double *d_b, double *d_c, int ROWS, int COL_A, int COL_B) {
    // Calculate global row and column indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundary conditions
    if (row < ROWS && col < COL_B) {
        double add = 0.0; // Accumulate result in a register
        // Loop unrolling (if beneficial) could be considered here
        for (int k = 0; k < COL_A; k++) {
            add += d_a[row * COL_A + k] * d_b[k * COL_B + col];
        }
        d_c[row * COL_B + col] = add; // Write result to global memory
    }
}