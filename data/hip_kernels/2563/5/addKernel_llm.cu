#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Optimize by calculating global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we only access valid memory
    if (i < N) {
        c[i] = a[i] + b[i];
    }
}