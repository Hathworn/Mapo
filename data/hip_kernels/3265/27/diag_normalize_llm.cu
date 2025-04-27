#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int n, int i) {
    // Calculate unique thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only one thread normalizes the diagonal element at (i, i)
    if (idx == i) {
        I[i * n + i] /= A[i * n + i];
        A[i * n + i] /= A[i * n + i];
    }
}