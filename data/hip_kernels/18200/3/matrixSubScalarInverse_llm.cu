#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixSubScalarInverse(double *a, double b, double *c, int cr, int cc){
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    // Unroll loops to improve memory access pattern
#pragma unroll
    for(int i = 0; i < 1; ++i){
        if(x < cc && y < cr){
            c[y * cc + x] = b - a[y * cc + x];
        }
    }
}