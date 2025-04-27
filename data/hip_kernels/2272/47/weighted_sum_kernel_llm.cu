```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Improved global index calculation by removing unnecessary components
    int totalThreads = blockDim.x * gridDim.x;      // Calculate total threads
    for (; i < n; i += totalThreads) {              // Use a loop to handle large data by iterating over the grid
        c[i] = s[i] * a[i] + (1 - s[i]) * (b ? b[i] : 0);
    }
}