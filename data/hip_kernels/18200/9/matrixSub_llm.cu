#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSub(double *a, double *b, double *c, int cr, int cc) {
    // Calculate thread's unique row and column index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    int idx = y * cc + x; // Pre-compute index for better performance

    if (x < cc && y < cr) {
        c[idx] = a[idx] - b[idx];
    }
}