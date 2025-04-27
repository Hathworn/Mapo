#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if index is out of bounds for groups
    if (i >= groups) return;
    
    // Initialize sum for each group
    float temp_sum = 0.0f;
    
    // Unroll loop to optimize memory access and computation
    for (int k = 0; k < n; k++) {
        temp_sum += x[k * groups + i];
    }
    
    // Write result back
    sum[i] = temp_sum;
}
```
