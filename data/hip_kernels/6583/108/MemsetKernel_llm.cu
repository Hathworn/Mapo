#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Flatten the 2D index to 1D
    int pos = idy * w + idx;

    // Boundary check
    if (idy < h && idx < w)
    {
        // Set the image value at position
        image[pos] = value;
    }
}