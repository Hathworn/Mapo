```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for better performance
__global__ void add(int a, int b, int *c) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread ID
    if (tid == 0) { // Ensure only one thread performs the operation
        *c = a + b;
    }
}