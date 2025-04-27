#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;
    
    float local_sum = 0.0f; // Use local variable for sum to reduce global memory transactions
    for (int k = 0; k < n; ++k) {
        local_sum += x[k * groups + i]; // Accumulate directly into local_sum
    }

    sum[i] = local_sum; // Assign final result to global memory once
}