#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize sum to 0 outside the loop
    float temp_sum = 0.0f;
    
    // Use stride to improve memory access pattern
    for (int k = i; k < n * groups; k += groups) {
        temp_sum += x[k];
    }
    
    // Store the calculated sum
    sum[i] = temp_sum;
}