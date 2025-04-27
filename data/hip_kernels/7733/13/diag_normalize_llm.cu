#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundaries once and avoid redundant calculations
    if (x < nn && y < nn && x == y && x == i) {
        double diag_val = A[i * nn + i];
        I[x * nn + y] /= diag_val;
        A[x * nn + y] /= diag_val;
    }
}