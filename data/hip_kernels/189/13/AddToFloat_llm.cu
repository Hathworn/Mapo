#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddToFloat(float *sum, float *out, const float *pIn)
{
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use the global ID for atomic addition
    if (idx < blockDim.x) // Ensure within bounds
    {
        atomicAdd(&out[idx], pIn[idx]);
    }
}