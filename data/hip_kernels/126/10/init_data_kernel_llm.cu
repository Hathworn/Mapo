#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_data_kernel(int n, double* x)
{
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use strided loop for better data access pattern
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        x[i] = n - i;
    }
}