```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 40

//--------------------------------------------------

// Compute C = A * B

//-------------------------------------------------

__global__ void MatrixMult(int m, int n, int k, double *a, double *b, double *c)
{
    // Optimize block access by calculating thread's row and column
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < m && col < k) {
        double temp = 0.0;
        // Use register to improve memory access speed
        for (int i = 0; i < n; ++i) {
            temp += a[row * n + i] * b[i * k + col];
        }
        c[row * k + col] = temp;
    }
}