#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void big_add(int *a, int *b, int *c, unsigned int N) {
    // Calculate unique index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop 4 times for better efficiency
    int stride = blockDim.x * gridDim.x * 4;
    for (; tid + 3 < N; tid += stride) {
        c[tid] = a[tid] + b[tid];
        c[tid + 1] = a[tid + 1] + b[tid + 1];
        c[tid + 2] = a[tid + 2] + b[tid + 2];
        c[tid + 3] = a[tid + 3] + b[tid + 3];
    }

    // Handle remaining elements
    for (; tid < N; tid += blockDim.x * gridDim.x) {
        c[tid] = a[tid] + b[tid];
    }
}