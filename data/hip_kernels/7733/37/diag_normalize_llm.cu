#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int nn, int i){
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check for valid indices
    if (x < nn && y < nn) {
        // Check for diagonal element and matching index
        if (x == y && x == i) {
            double diag_value = A[i * nn + i];
            // Normalize matrix elements
            I[x * nn + y] /= diag_value;
            A[x * nn + y] /= diag_value;
        }
    }
}