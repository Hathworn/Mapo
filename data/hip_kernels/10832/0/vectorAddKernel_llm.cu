#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddKernel(float *a, float *b, float *c, int n) {
    // Using blockIdx.x and blockDim.x for efficient indexing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Proper boundary check
    if (idx < n) {
        // Perform the vector addition
        c[idx] = a[idx] + b[idx];
    }
}