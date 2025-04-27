#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAdd(double *a, double *b, double *c, int cr, int cc) {
    // Calculate a single index to reduce the number of computations
    long idx = (blockIdx.y * blockDim.y + threadIdx.y) * cc + (blockIdx.x * blockDim.x + threadIdx.x);
    
    // Use an inline check to ensure both x and y are within bounds
    if (idx < cr * cc) {
        c[idx] = a[idx] + b[idx];
    }
}