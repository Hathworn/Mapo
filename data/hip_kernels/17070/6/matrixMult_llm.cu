#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMult(int* m, int* n, int* p, int size)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int p_sum = 0; // Initialize the sum to zero

    // Unroll loop for performance
    for (int i = 0; i < size; i++) {
        p_sum += m[row * size + i] * n[i * size + col]; // Fix index to correctly access n
    }

    if (row < size && col < size) { // Ensure within matrix bounds
        p[row * size + col] = p_sum;
    }
}