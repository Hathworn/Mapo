#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSubScalarInverse(double *a, double b, double *c, int cr, int cc){

    // Calculate global thread ID in matrix
    int index = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x;

    // Ensure work is only done within valid data range
    if(index < cr * cc){
        c[index] = b - a[index];
    }
}