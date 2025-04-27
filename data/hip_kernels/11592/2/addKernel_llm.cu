#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Optimize by calculating the global thread index for full utilization
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use (if) condition to prevent out-of-bound access for arrays larger than block size
    if (i < N)  // Assuming N is the total number of elements
    {
        c[i] = a[i] + b[i];
    }
}