#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void nodiag_normalize(double *A, double *I, int n, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use a single combined condition to reduce nesting
    if (x < n && y < n && x == i && x != y) {
        double diagVal = A[i*n + i]; // Cache the diagonal value for reuse
        I[x*n + y] /= diagVal;
        A[x*n + y] /= diagVal;
    }
}