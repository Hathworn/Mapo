#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Optimize: Use shared memory for normalization factor
    __shared__ float sharedNormalizationFactor[BLOCKDIM_X * BLOCKDIM_Y];

    int localIdx = threadIdx.y * blockDim.x + threadIdx.x;

    if (i < h && j < w) {
        const int pos = i * s + j;
        
        // Load normalization factor to shared memory
        sharedNormalizationFactor[localIdx] = normalization_factor[pos];
        __syncthreads();
        
        float scale = sharedNormalizationFactor[localIdx];

        // Prevent division by zero
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        // Normalize image using preloaded factor from shared memory
        image[pos] *= invScale;
    }
}