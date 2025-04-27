#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixTranspose(double *a, double *c, int cr, int cc) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    // Check if the current thread is within bounds
    if (x < cc && y < cr) {
        // Optimize with coalesced access pattern
        int rowStart = y * cc;
        int colStart = x * cr;
        c[rowStart + x] = a[colStart + y];
    }
}