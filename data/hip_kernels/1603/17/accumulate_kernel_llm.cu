#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize sum for this thread
    float thread_sum = 0.0f;
    
    // Perform accumulation
    for(int k = 0; k < n; ++k)
    {
        thread_sum += x[k * groups + i];
    }
    
    // Write the result to global memory
    sum[i] = thread_sum;
}