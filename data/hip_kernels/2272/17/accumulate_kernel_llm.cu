#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (i >= groups) return;

    float temp_sum = 0.0f; // Use register for temporary sum
    for (int k = 0; k < n; ++k) {
        temp_sum += x[k * groups + i];
    }
    
    sum[i] = temp_sum; // Store final sum
}