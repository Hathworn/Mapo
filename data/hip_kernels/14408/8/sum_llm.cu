#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using grid-stride loop
__global__ void sum(int *a, int *b, int *c, int N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < N; i += stride) {
        c[i] = a[i] + b[i];
    }
}