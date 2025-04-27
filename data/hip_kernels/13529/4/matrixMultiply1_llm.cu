#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiply1(float *A, float *C, int size) {
    int Col = blockDim.x * blockIdx.x + threadIdx.x; // Correct columns calculation
    int Row = blockDim.y * blockIdx.y + threadIdx.y; // Correct rows calculation

    // Check boundary to prevent excess memory access
    if (Row < size && Col < size) {
        float sum = 0.0f; // Use a local variable to accumulate sum
        for (int k = 0; k < size; k++) {
            sum += A[k * size + Row] * A[k * size + Col];
        }
        C[Row * size + Col] = sum; // Store the result
    }
}