#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *c , int *d) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;  // Calculate global thread ID
    if (tid < N) { // Boundary check to ensure not accessing out of bounds
        d[tid] += c[tid];
    }
}