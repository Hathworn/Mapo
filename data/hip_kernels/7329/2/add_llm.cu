#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    c[idx] = a[idx] + b[idx]; // Perform addition using global index
}