#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMult(int* m, int* n, int* p, int size)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int p_sum = 0; // Initialize p_sum to 0

    if (row < size && col < size) { // Ensure thread is within bounds
        for (int i = 0; i < size; i++) {
            p_sum += m[row * size + i] * n[i * size + col]; // Correct index for n
        }
        p[row * size + col] = p_sum;
    }
}