#include "hip/hip_runtime.h"
#include "includes.h"

/* Helper function to extract the imaginary part of a float2 */
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

/* Optimized global kernel function */
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x; // Compute column index
    int i_start = blockIdx.y * blockDim.y * w;     // Start position for row in block

    int totalThreads = blockDim.y * gridDim.y;     // Total threads in y dimension
    int stride = totalThreads * w;                 // Stride for all elements in a block row

    for (int i = i_start + threadIdx.y * w; i < w * h; i += stride)
    {
        if (j < w)
        {
            image[i + j] = value;                    // Set the value directly
        }
    }
}