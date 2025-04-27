#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique thread index
    if (tid < N) {  // Ensure the index is within the range of the arrays
        c[tid] = a[tid] + b[tid];
    }
}