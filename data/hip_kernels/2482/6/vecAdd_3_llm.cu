#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_3(double *a, double *b, double *c, int n)
{
    // Calculate unique global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by parallelizing outer loop across threads
    for(int i = id; i < n * n; i += blockDim.x * gridDim.x)
    {
        c[i] = a[i] + b[i];
    }
}