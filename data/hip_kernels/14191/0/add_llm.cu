#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) { // Ensure within bounds
        c[index] = a[index] + b[index];
    }
}