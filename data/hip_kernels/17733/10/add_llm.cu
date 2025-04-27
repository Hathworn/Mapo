#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by removing global memory access
__global__ void add(int a, int b, int *c) {
    int result = a + b;  // Perform addition in a register
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *c = result;  // Write result back to global memory only once
    }
}