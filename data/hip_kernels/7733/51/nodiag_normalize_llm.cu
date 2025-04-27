#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(float *A, float *I, int n, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure x and y are within bounds and x equals i, but x is not equal to y
    if (x == i && x != y && y < n) {
        float diag = A[i * n + i];  // Cache the diagonal element for reuse
        I[x * n + y] /= diag;
        A[x * n + y] /= diag;
    }
}