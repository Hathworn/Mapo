#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReturnFloat(float *sum, float *out, const float *pIn)
{
    // Use block and thread indices for optimizing memory access
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check for valid index within the input array size for safe memory access
    if (idx < blockDim.x)
    {
        atomicAdd(&out[idx], pIn[idx]);
    }
}