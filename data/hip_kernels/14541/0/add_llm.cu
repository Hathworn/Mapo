#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread does not exceed array bounds
    if (tid < N) {
        // Perform the addition
        c[tid] = a[tid] + b[tid];
    }
}