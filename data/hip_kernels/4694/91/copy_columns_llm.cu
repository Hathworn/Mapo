#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_columns(float* input, float* output, const int nx, const int ny)
{
    // Calculate a single linear index to improve memory access coalescing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (int i = idx; i < nx * ny; i += stride)
    {
        output[i] = input[i];
    }
}