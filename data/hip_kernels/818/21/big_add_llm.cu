#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void big_add(int *a, int *b, int *c, unsigned int N) {
    // Compute global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Prefetch data assuming N is a multiple of stride
    for (; tid < N; tid += stride) {
        c[tid] = a[tid] + b[tid];
    }
}