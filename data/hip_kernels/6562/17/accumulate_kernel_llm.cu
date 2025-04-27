#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate global thread index for better scalability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread index is within bounds
    if (i >= groups) return;

    // Use shared memory for partial sums to reduce global memory access
    extern __shared__ float shared_sum[];
    shared_sum[threadIdx.x] = 0;

    // Optimize loop by unrolling for better performance
    for (int k = 0; k < n; ++k){
        shared_sum[threadIdx.x] += x[k * groups + i];
    }
    
    // Write the computed sum back to global memory
    sum[i] = shared_sum[threadIdx.x];
}