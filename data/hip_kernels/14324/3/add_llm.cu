#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function to utilize multiple threads
__global__ void add(int a, int b, int *c) {
    int tid = threadIdx.x + blockDim.x * blockIdx.x;  // Calculate unique thread ID
    if (tid == 0) {
        *c = a + b;  // Compute addition using the first thread only
    }
}