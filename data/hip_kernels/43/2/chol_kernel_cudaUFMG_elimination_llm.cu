#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void chol_kernel_cudaUFMG_elimination(float * U, int k) {
    // Calculate the current row based on block index
    int i = (k + 1) + blockIdx.x;

    // Calculate starting index for this thread
    int jstart = i + threadIdx.x;
    int jstep = blockDim.x;

    // Pre-calculate indexes for efficient access
    int kM = k * MATRIX_SIZE;
    int iM = i * MATRIX_SIZE;
    int ki = kM + i;

    float uki = U[ki];  // Load U[ki] to a register for faster repeated access

    // Process the rows, striding according to total threads in the block
    for (int j = jstart; j < MATRIX_SIZE; j += jstep) {
        U[iM + j] -= uki * U[kM + j];  // Perform the row elimination update
    }
}