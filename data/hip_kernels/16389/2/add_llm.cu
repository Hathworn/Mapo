#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void add(int *a, int *b, int *c, int size) {
    int idx = size * blockIdx.x + threadIdx.x; // Precompute index
    c[idx] = a[idx] + b[idx]; // Use precomputed index
}