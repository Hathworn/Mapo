#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude(float *vec, const int n)
{
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use intrinsics for faster absolute value calculation
    if (xIndex < n) {
        vec[xIndex] = fabsf(vec[xIndex]);
    }
}