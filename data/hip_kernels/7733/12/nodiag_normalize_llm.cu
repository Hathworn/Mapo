```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check within matrix bounds and within same row, not diagonal
    if (x == i && x != y && y < nn) {
        double diagElement = A[i*nn + i]; // Cache diagonal element
        I[x*nn + y] /= diagElement;
        A[x*nn + y] /= diagElement;
    }
}