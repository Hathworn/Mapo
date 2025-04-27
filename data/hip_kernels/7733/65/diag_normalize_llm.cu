#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int nn, int i) {
    // Single calculation for block matching x == i
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < nn && x == i) {
        I[x * nn + x] /= A[i * nn + i];
        A[x * nn + x] /= A[i * nn + i];
    }
}