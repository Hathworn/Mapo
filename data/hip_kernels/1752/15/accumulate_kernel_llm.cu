#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate global thread index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Return if the index is out of range
    if (i >= groups) return;
    
    // Use local variable to accumulate results to reduce memory access
    float local_sum = 0.0f;
    
    // Perform accumulation
    for(int k = 0; k < n; ++k){
        local_sum += x[k * groups + i];
    }
    
    // Write back to global memory
    sum[i] = local_sum;
}