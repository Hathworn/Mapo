#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultKernel_global(float* Ad, float* Bd, float* Cd, int n)
{
    // Calculate row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int column = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary conditions to prevent unnecessary computation
    if(row >= n || column >= n) return;

    float Celem = 0.0;

    // Use a single pointer arithmetic expression to improve readability
    for(int j = 0; j < n; j++) {
        Celem += Ad[row * n + j] * Bd[j * n + column];
    }

    // Store computed value in result matrix
    Cd[row * n + column] = Celem;
}