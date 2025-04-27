#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_vecAdd(float *y, float *a, float *b, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop by processing multiple elements per thread to enhance performance
    int stride = gridDim.x * blockDim.x;
    for (int idx = i; idx < n; idx += stride) {
        y[idx] = a[idx] + b[idx];
    }
}