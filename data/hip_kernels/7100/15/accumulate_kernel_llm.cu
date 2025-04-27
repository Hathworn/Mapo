#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;
    
    float local_sum = 0; // Declare local variable for sum
    
    for(int k = 0; k < n; ++k){
        local_sum += x[k * groups + i]; // Accumulate in local variable to reduce global memory access
    }
    
    sum[i] = local_sum; // Write result back to global memory once
}