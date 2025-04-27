#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void squareMatrixMulKernel(int *c, int *a, int *b, int arrayWidth)
{
    // Sum initialized to zero
    float sum = 0.0f;

    // Calculate global thread indices for row and column
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within matrix bounds
    if (row < arrayWidth && col < arrayWidth) {
        // Perform dot product of row and column
        for (int i = 0; i < arrayWidth; ++i) {
            float Aelement = static_cast<float>(a[row * arrayWidth + i]);
            float Belement = static_cast<float>(b[i * arrayWidth + col]);
            sum += Aelement * Belement;
        }
        // Store the result in matrix c
        c[row * arrayWidth + col] = static_cast<int>(sum);
    }
}