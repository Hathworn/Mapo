#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorLength(int *size, const double *x, const double *y, double *len) {
    const long ix = blockIdx.x * blockDim.x + threadIdx.x;
    if (ix < *size) {
        // Pre-compute squares to avoid redundancy
        const double x_val = x[ix];
        const double y_val = y[ix];
        len[ix] = sqrt(x_val * x_val + y_val * y_val);
    }
}