#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function with loop unrolling
extern "C"
__global__ void add(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    for (int idx = i; idx < n; idx += gridSize) {
        sum[idx] = a[idx] + b[idx];
    }
}