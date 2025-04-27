```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_2(double *a, double *b, double *c, int n)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop iteration optimized with stride access
    for (int i = id; i < n * blockDim.x; i += blockDim.x * gridDim.x) 
    {
        c[i] = a[i] + b[i];
    }
}