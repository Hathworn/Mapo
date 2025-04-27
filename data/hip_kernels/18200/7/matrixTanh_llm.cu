#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTanh(double *a, double *c, int cr, int cc) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    // Use a single index calculation to help compiler optimization
    int index = y * cc + x;
    
    if (x < cc && y < cr) {
        c[index] = tanh(a[index]);
    }
}