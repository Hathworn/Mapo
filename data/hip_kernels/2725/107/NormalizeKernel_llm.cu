#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Use shared memory for better memory access times
    extern __shared__ float shared_normalization_factor[];
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    if (i >= h || j >= w) return;
    
    // Load data into shared memory
    int pos = i * s + j;
    shared_normalization_factor[threadIdx.y * blockDim.x + threadIdx.x] = normalization_factor[pos];
    __syncthreads();

    float scale = shared_normalization_factor[threadIdx.y * blockDim.x + threadIdx.x];
    
    float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

    image[pos] *= invScale;
}