#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FillOnes(float* vec, int value)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if idx is within valid range and exit early if not.
    if(idx >= value) return;

    // Directly assign the value 1.0f to the vector at idx.
    vec[idx] = 1.0f;
}