#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Compute global index based on block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure index is less than the total number of elements
    if(i < n) {
        // Perform weighted sum calculation
        c[i] = s[i] * a[i] + (1.0f - s[i]) * (b ? b[i] : 0.0f);
    }
}