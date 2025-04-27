#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Calculate global thread index for handling larger data
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure operation is within bounds
    if(tid < N) {
        c[tid] = a[tid] + b[tid];
    }
}