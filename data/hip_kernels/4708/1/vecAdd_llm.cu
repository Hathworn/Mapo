#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(double *a, double *b, double *c, int n) {
    // Calculate total threads and thread id
    int stride = gridDim.x * blockDim.x;
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Process multiple elements per thread
    for (int i = id; i < n; i += stride)
        c[i] = a[i] + b[i];
}