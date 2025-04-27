#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_zero_nonmax_kernel(int n, int *indexes, float *prev_delta)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (id >= n) return;
    
    // Zero out non-max indices
    if (indexes[id] != id) prev_delta[id] = 0;
}