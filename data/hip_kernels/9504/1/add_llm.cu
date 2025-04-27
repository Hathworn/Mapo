#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Use blockIdx.x, blockDim.x and threadIdx.x for grid-stride loop
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int gridSize = blockDim.x * gridDim.x;

    // Stride through the arrays in case number of threads is less than array size
    while (index < N) {
        c[index] = a[index] + b[index];
        index += gridSize;
    }
}