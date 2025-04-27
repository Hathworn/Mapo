#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixDivisionScalar(double *a, double b, double *c, int cr, int cc) {

    // Calculate unique global thread index
    int idx = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x;

    // Check index within bounds before processing
    if(idx < cr * cc) {
        c[idx] = a[idx] / b;
    }
}