#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixLogit(double *a, double *c, int cr, int cc){

    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    // Ensure thread within matrix bounds
    if (x < cc && y < cr) {
        double val = a[y * cc + x]; // Load once
        c[y * cc + x] = log(val / (1 - val)); // Compute logit
    }
}