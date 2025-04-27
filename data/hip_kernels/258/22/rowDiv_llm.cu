#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel
__global__ void rowDiv(float* a, float* b, float* c, int M, int N) {
    int row = blockIdx.x;  // Compute row index
    int col = threadIdx.x;  // Compute column index
    int i = row * blockDim.x + col;
    
    // Ensure index is within bounds
    if (i < M * N) {
        c[i] = a[i] / b[row];  // Perform division with optimized indexing
    }
}