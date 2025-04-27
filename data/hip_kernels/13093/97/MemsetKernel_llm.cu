#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the global thread indices
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Boundary check to prevent out-of-bounds access
    if (i < h && j < w) 
    {
        // Compute the linear index
        const int pos = i * w + j;

        // Set value directly in global memory
        image[pos] = value;
    }
}