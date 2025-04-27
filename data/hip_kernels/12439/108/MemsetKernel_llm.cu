#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Compute unique global index for each thread
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int globalIdy = blockIdx.y * blockDim.y + threadIdx.y;

    // Flattened global position for efficiency
    int pos = globalIdy * w + globalIdx;

    if (globalIdy < h && globalIdx < w)
    {
        image[pos] = value; // Direct memory set for active threads
    }
}