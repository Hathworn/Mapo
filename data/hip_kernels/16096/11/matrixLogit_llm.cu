#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixLogit(double *a, double *c, int cr, int cc) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    // Use private variable to reduce memory access and improve performance
    if (x < cc && y < cr) {
        double a_val = a[y * cc + x];
        c[y * cc + x] = log(a_val / (1 - a_val));
    }
}