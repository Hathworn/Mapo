#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Use global thread ID
    if (tid < n)  // Ensure thread is within bounds
        c[tid] = a[tid] + b[tid];
}