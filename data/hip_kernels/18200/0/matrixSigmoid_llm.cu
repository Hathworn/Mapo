#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSigmoid(double *a, double *c, int cr, int cc) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    if (x < cc && y < cr) {
        double a_val = a[y * cc + x]; // Reduce redundant memory access
        c[y * cc + x] = 1.0 / (1.0 + exp(-a_val));
    }
}