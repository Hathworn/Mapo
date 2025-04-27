#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAddScalar(double *a, double b, double *c, int cr, int cc) {
    // Calculate the global index for current thread
    int index = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x;
    
    // Perform addition only if index is within bounds
    if (index < cr * cc) {
        c[index] = a[index] + b; // Direct access using global index
    }
}