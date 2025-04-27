#include "hip/hip_runtime.h"
#include "includes.h"

#define N 100000000

__global__ void daxpy_simple(int n, double alpha, double *x, double *y) {
    // Use a loop to process multiple elements per thread
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < n; idx += blockDim.x * gridDim.x) {
        y[idx] += alpha * x[idx];
    }
}