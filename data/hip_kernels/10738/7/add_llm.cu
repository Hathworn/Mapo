#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* a, int* b, int* c) {
    // Optimization note: use a local variable to reduce global memory accesses.
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition and store result in a local register variable first.
    int sum = a[id] + b[id];
    
    // Write result back to global memory.
    c[id] = sum;
}