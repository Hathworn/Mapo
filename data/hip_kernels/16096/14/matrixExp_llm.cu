#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixExp(double *a, double *c, int cr, int cc) {
    // Calculate global thread ID for both row and column
    int idx = blockIdx.y * blockDim.y + threadIdx.y; // row
    int idy = blockIdx.x * blockDim.x + threadIdx.x; // col

    // Ensure index is within bounds and perform the operation
    if (idx < cr && idy < cc) {
        int index = idx * cc + idy;
        c[index] = exp(a[index]);
    }
}