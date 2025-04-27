#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void matrixMultiplicationKernelEW(const float* A, const float* B, float* C, int a, int b) {
    int ROW = blockIdx.y * blockDim.y + threadIdx.y;
    int COL = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if ROW and COL are within bounds
    if (ROW < a && COL < b) {
        // Optimize by calculating index once
        int index = ROW * b + COL;
        C[index] = A[index] * B[index];
    }
}