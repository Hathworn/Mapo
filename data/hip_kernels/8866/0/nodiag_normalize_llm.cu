#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(double *A, double *I, int n, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure only relevant threads execute the division
    if (x == i && x != y && y < n) {
        double diag_val = A[i * n + i];  // Cache diagonal element
        I[x * n + y] /= diag_val;
        A[x * n + y] /= diag_val;
    }
}