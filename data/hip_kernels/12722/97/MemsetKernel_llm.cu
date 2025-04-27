#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate global thread index for linear memory access
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure the global index falls within the dimensions of the image
    if (idx < w && idy < h) {
        const int pos = idy * w + idx;
        image[pos] = value;
    }
}