#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void matrixDivisionKernelEW(const float* A, const float* B, float* C, int a, int b) {
    // Calculate the unique index for each thread to avoid accessing out of bounds
    int ROW = blockIdx.y * blockDim.y + threadIdx.y;
    int COL = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index calculation correctly reflects the grid's dimensions
    int index = ROW * b + COL; // Using 'b' for column in calculation

    if (ROW < a && COL < b) {
        // Simplify index arithmetic and ensure indices are valid
        C[index] = A[index] / B[index];
    }
}