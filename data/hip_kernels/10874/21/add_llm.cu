#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Optimize memory access pattern
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Use stride loop to ensure all elements are processed
    for (int i = tid; i < N; i += stride) {
        c[i] = a[i] + b[i];
    }
}