#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *a, float *b, float *c) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread index

    if (tid < N) { // Ensure index is within bounds
        c[tid] = a[tid] + b[tid]; // Perform addition
    }
}