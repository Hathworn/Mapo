#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;   // Compute global thread x-index
    int y = blockIdx.y * blockDim.y + threadIdx.y;   // Compute global thread y-index

    // Guard conditions
    if (x < nn && y < nn && x == y && x == i) {
        double diag_elem = A[i * nn + i];            // Load diagonal element
        I[x * nn + y] /= diag_elem;                  // Normalize I matrix element
        A[x * nn + y] /= diag_elem;                  // Normalize A matrix element
    }
}