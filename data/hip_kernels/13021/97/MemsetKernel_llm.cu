#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index for flattening
    int index = blockIdx.y * blockDim.y * w + threadIdx.y * w + blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary before writing
    if (index >= h * w) return;
    
    image[index] = value;
}