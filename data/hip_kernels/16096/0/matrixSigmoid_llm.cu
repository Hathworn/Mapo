#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSigmoid(double *a, double *c, int cr, int cc) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col index
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row index

    // Calculate the linear index and perform the operation if within bounds
    int idx = y * cc + x;
    if (x < cc && y < cr) {
        // Direct computation using pre-calculated index
        c[idx] = 1.0 / (1 + exp(-a[idx]));
    }
}