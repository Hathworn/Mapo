#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_pow_kernel(int n, float *x, float a, float *y)
{
    // Use shared memory optimization and calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        y[i] = powf(x[i], a); // Use powf for faster execution with single-precision floats
    }
}