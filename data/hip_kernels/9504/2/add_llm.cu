#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Use thread index within block to leverage more parallelism
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure we do not access out-of-bound array elements
    if (idx < gridDim.x * blockDim.x) {
        c[idx] = a[idx] + b[idx];
    }
}