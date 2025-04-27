#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void matrixElementWiseMultiplicationKernelOptimized(const float* A, const float* B, float* C, int a, int b) {

    // Efficient index calculation for 1D grid of blocks processing
    int idx = blockIdx.y * blockDim.y * b + threadIdx.y * b + blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid redundant calculations, improve memory coalescing
    if (idx < a * b) {
        C[idx] = A[idx] * B[idx];
    }
}