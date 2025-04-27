#include "hip/hip_runtime.h"
#include "includes.h"

#define N 100000000

__global__ void vec_sum(float* a, float* b, float* c) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (tid < N) {
        c[tid] = a[tid] + b[tid];
    }
}