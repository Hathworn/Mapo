#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_float2double (int n, double *output, float *input)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.x * gridDim.x) + 
             (threadIdx.y * gridDim.x * blockDim.x);

    // Check bounds and perform conversion
    if (id < n)
    {
        output[id] = (double)input[id];
    }
}