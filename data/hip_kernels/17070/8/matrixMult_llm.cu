#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMult(int* m, int* n, int* p, int size)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int p_sum = 0;  // Initialize sum to zero

    for (int i = 0; i < size; i++) {
        // Use coalesced memory access for m and n
        p_sum += m[row * size + i] * n[i * size + col];
    }
    
    p[row * size + col] = p_sum;
}