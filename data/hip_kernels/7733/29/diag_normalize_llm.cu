#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Combine conditions to reduce branching
    if (x == y && x < nn && x == i) {
        double diag_value = A[i * nn + i]; // Cache diagonal value
        I[x * nn + y] /= diag_value;
        A[x * nn + y] /= diag_value;
    }
}