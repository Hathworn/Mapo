#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int N, double *a, double *b, double *c)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling the loop for performance when possible
    int stride = blockDim.x * gridDim.x;
    while (tid < N) {
        c[tid] = a[tid] + b[tid];
        tid += stride;
    }
}