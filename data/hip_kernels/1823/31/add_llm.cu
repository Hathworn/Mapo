#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better performance
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}