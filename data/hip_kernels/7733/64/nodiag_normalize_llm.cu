#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(double *A, double *I, int nn, int i){
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Single condition check; remove duplicate checks
    if (x < nn && y < nn && x == i && x != y) {
        double diag_value = A[i * nn + i];  // Cache the diagonal value
        I[x * nn + y] /= diag_value;
        A[x * nn + y] /= diag_value;
    }
}