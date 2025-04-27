#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixHadamard(double *a, double *b, double *c, int cr, int cc) {
    // Calculate the unique thread index directly
    int idx = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x;

    // Ensure index is within bounds of the matrices
    if (idx < cr * cc) {
        c[idx] = a[idx] * b[idx];
    }
}