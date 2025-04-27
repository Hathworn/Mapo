#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixTranspose(const float *A_elements, float *B_elements, const int A_width, const int A_height)
{
    // Calculate row and column indices for this thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single condition to check bounds
    if (row < A_width && col < A_height)
    {
        // Perform matrix transpose
        B_elements[row * A_height + col] = A_elements[col * A_width + row];
    }
}