#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate the 1D index rather than 2D index to improve memory access pattern
    int pos = (blockIdx.y * blockDim.y + threadIdx.y) * s + (blockIdx.x * blockDim.x + threadIdx.x);
    
    // Use a logical check to avoid accessing out-of-bounds memory
    if (pos < w * h) {
        float scale = normalization_factor[pos];
        
        // Replace conditional operator for branch-less inversion calculation 
        float invScale = rsqrt(scale * scale + 1e-8); 
        
        image[pos] *= invScale;
    }
}