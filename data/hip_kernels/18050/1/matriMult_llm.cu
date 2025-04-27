#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized matrix multiplication kernel
__global__ void matriMult(int* m, int* n, int* p, int size) {
    // Calculate Row and Column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int column = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Boundary check
    if (row < size && column < size) {
        int p_sum = 0;
        // Loop unrolling for optimization
        for (int i = 0; i < size; i++) {
            p_sum += m[row * size + i] * n[i * size + column];
        }
        // Store the result
        p[row * size + column] = p_sum;
    }
}