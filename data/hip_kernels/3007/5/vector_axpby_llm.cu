#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

}

__global__ void vector_axpby (const int n, const REAL alpha, const REAL* __restrict__ x, const int offset_x, const int stride_x, const REAL beta, REAL* __restrict__ y, int offset_y, int stride_y) {

    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid < n) {
        const int ix = offset_x + gid * stride_x;
        const int iy = offset_y + gid * stride_y;
        // Use FMA operations to improve performance by reducing rounding errors
        y[iy] = fma(alpha, x[ix], beta * y[iy]);
    }
}