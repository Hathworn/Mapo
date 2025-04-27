#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixDivisionScalar(double *a, double b, double *c, int cr, int cc) {
    // Calculate the global thread index
    int idx = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x; 

    // Use a single if condition to check within bounds
    if (idx < cr * cc) {
        c[idx] = a[idx] / b;
    }
}