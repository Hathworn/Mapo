```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(double *a, double *b, double *c, int n) 
{
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop for grid-stride access pattern
    int stride = blockDim.x * gridDim.x;

    for (int i = tid; i < n; i += stride) {
        c[i] = a[i] + b[i];
    }
}