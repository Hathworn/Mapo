#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate unique global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure that the thread is within bounds
    if (i < groups) {
        float group_sum = 0.0f;  // Use a register to hold the accumulating sum
        for (int k = 0; k < n; ++k) { 
            group_sum += x[k * groups + i];
        }
        sum[i] = group_sum;  // Write the computed sum to the output array
    }
}