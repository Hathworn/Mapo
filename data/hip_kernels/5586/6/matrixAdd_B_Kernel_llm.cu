#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAdd_B_Kernel(float* A, float* B, float* C, size_t pitch, int width) {
    // Compute indexes
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;  // Use blockIdx.y and threadIdx.y for col index
    int rowWidthWithPad = pitch / sizeof(float);

    // Add boundary check for both row and col
    if (row < width && col < width) {
        C[row * rowWidthWithPad + col] = A[row * rowWidthWithPad + col] + B[row * rowWidthWithPad + col];
    }
}