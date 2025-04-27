#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAdd_C_Kernel(float* A, float* B, float* C, size_t pitch, int width) {
    // Compute indexes
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    int rowWidthWithPad = pitch / sizeof(float);

    // Check bounds for valid threads
    if (col < width && row < width) {
        // Directly calculate the index for each element
        int index = row * rowWidthWithPad + col;
        C[index] = A[index] + B[index];
    }
}