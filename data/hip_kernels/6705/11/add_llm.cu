#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;  // Use full thread index
    if(tid < N) 
        c[tid] = a[tid] + b[tid];  // Coalesced memory access
}