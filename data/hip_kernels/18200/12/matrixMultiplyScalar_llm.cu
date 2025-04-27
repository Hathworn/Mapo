#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiplyScalar(double *a, double b, double *c, int cr, int cc) {
    // Calculate the global thread index in the matrix
    int idx = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x;
    
    // Ensure the thread operates only within bounds
    if (idx < cr * cc) {
        c[idx] = a[idx] * b; // Perform scalar multiplication
    }
}