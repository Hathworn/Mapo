#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Perform index boundary check once and remove redundant checks
    if (x < nn && y < nn && x == i && x != y) {
        double factor = A[i * nn + i];  // Cache A[i*nn+i] to reduce global memory access
        I[x * nn + y] /= factor;
        A[x * nn + y] /= factor;
    }
}