#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAddScalar(double *a, double b, double *c, int cr, int cc){
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    // Index calculation outside the condition to avoid recalculation
    int idx = y * cc + x;

    // Ensure threads within matrix boundaries perform computations
    if(x < cc && y < cr) {
        c[idx] = a[idx] + b; // Efficient element access
    }
}