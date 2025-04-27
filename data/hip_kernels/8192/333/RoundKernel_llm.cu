#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RoundKernel(float* input, float* output, int size)
{
    // Optimize grid index calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if(id < size)
    {
        // Use device function for rounding
        output[id] = __float2int_rn(input[id]);
    }
}