```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rsub_double(int n, double *a, double *b, double *sum)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Stride loop to allow handling arrays larger than grid size
    for (int index = i; index < n; index += blockDim.x * gridDim.x)
    {
        sum[index] = b[index] - a[index];
    }
}