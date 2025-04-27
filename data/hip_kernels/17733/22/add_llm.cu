#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (tid < n) // Use global index for boundary check
        c[tid] = a[tid] + b[tid];
}