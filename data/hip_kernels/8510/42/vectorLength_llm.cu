#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorLength(int size, const double *x, const double *y, double *len) {
    // Calculate index outside loop to avoid redundant computation
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    if (ix < size) {
        // Directly store the computation of x[ix] * x[ix] and y[ix] * y[ix] to reduce calculation steps
        double x_sq = x[ix] * x[ix];
        double y_sq = y[ix] * y[ix];
        len[ix] = sqrt(x_sq + y_sq);
    }
}