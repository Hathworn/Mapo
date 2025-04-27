#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure x and y are within bounds, and only process off-diagonal elements of row i
    if (x < nn && y < nn && x == i && x != y) {
        double diag_value = A[i * nn + i];
        I[x * nn + y] /= diag_value;  // Normalize I matrix
        A[x * nn + y] /= diag_value;  // Normalize A matrix
    }
}