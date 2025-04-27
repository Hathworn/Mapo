```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiplyScalar(double *a, double b, double *c, int cr, int cc) {
    // Calculate a single index instead of x and y separately
    int index = blockIdx.y * blockDim.y * cc + threadIdx.y * cc + blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single barrier for range check
    if (index < cr * cc) {
        c[index] = a[index] * b;
    }
}