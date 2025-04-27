#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to add elements of two arrays with optimization
__global__ void add(int *a, int *b, int *c) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    c[idx] = a[idx] + b[idx]; // Perform addition using global index
}