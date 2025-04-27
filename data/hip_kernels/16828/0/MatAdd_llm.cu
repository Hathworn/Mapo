#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized: Add two matrices using HIP
__global__ void MatAdd(int *a, int *b, int *c, int ROW, int COLUMNS) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < COLUMNS && iy < ROW) { // Corrected boundary check
        int idx = iy * COLUMNS + ix; // Moved calculation inside bounds check
        c[idx] = a[idx] + b[idx];
    }
}