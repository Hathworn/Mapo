#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c) {
    // Calculate unique thread index across the grid
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 
    // Use the unique thread index for computation
    if (tid < N) { 
        c[tid] = a[tid] + b[tid]; // Perform addition
    }
}