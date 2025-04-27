#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSubScalar(double *a, double b, double *c, int cr, int cc) {
    // Calculate the linear index once
    int idx = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x;

    // Ensure work is within bounds
    if (threadIdx.y + blockIdx.y * blockDim.y < cr && threadIdx.x + blockIdx.x * blockDim.x < cc) {
        c[idx] = a[idx] - b;
    }
}