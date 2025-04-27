#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAddKernel(float* __restrict__ A, float* __restrict__ B, float* __restrict__ C, int n)
{
    // Calculate global thread indexes using block and thread dimensions
    const int Row = blockIdx.y * blockDim.y + threadIdx.y;
    const int Col = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform the addition only if within matrix boundaries
    if (Row < n && Col < n) {
        // Use temporary variable to avoid index recalculation
        const int index = Row * n + Col;
        C[index] = A[index] + B[index];
    }
}