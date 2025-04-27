#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use a 1D grid for simpler index computation
    if (i >= groups) return;
    
    float local_sum = 0; // Use a local variable to reduce global memory access
    for (int k = 0; k < n; ++k) {
        local_sum += x[k * groups + i];
    }
    sum[i] = local_sum; // Write back to global memory once
}