#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matadd(const float *a, const float *b, float *c, int n, int m) {
    // Calculate the global thread index in a 1D flattened grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * n;
    if (idx < n * m) {
        c[idx] = a[idx] + b[idx];
    }
}