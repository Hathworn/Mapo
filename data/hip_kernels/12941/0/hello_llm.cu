#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by improving memory access pattern
__global__ void hello(char *a, int *b) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    a[idx] += b[idx]; // Use global index to access memory more efficiently
}