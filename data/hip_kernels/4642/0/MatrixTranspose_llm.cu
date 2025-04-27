#include "hip/hip_runtime.h"
#include "includes.h"

// Improved version of MatrixTranspose kernel function
__global__ void MatrixTranspose(float *a, float *b, int nx, int ny) {
    // Utilize built-in variables to calculate global index more efficiently
    int ix = blockIdx.x * blockDim.x + threadIdx.x; 
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit if index is out of bounds
    if (ix >= nx || iy >= ny) return;

    // Calculate linear indices for input and output matrices
    int idx = ix * ny + iy;
    int odx = iy * nx + ix;

    // Perform the transpose
    b[odx] = a[idx];
}