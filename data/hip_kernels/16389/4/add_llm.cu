#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    // Make sure to stay within bounds
    if (idx < gridDim.x * blockDim.x) {
        c[idx] = a[idx] + b[idx];
    }
}