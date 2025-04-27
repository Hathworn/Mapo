```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(float *A, float *I, int n, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimize by combining nested conditions and redundant computations
    if (x == y && x < n && x == i) {
        float diag_value = A[i * n + i];
        I[x * n + y] /= diag_value;
        A[x * n + y] /= diag_value;
    }
}