#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c) {
    // Calculate unique thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    // Loop over elements with strided access
    for (int i = tid; i < N; i += stride) {
        c[i] = a[i] + b[i];
    }
}