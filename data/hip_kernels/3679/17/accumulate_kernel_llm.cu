#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate global index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;
    
    float local_sum = 0;  // Use local variable for accumulation to reduce global memory access
    for (int k = 0; k < n; ++k) {
        local_sum += x[k * groups + i];
    }
    sum[i] = local_sum;  // Write the result once outside the loop
}