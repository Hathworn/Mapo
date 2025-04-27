```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < 500) // Boundary check added
    {
        c[idx] = a[idx] + b[idx]; // Removed redundant loop
    }
}