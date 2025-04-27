#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuAdd(int *a, int *b, int *c, int N)
{
    // Calculate global offset
    int offset = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x; 
    if (offset < N)
    {
        c[offset] = a[offset] + b[offset]; // Perform element-wise addition
    }
}