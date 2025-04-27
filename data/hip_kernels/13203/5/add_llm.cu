#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Calculate unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform boundary check to avoid out-of-bounds access
    if (index < gridDim.x * blockDim.x) {
        c[index] = a[index] + b[index];
    }
}