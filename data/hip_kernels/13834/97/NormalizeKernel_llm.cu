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

    // Use shared memory to cache normalization factor
    __shared__ float shared_normalization_factor[BLOCK_SIZE_X * BLOCK_SIZE_Y];
    int threadIndex = threadIdx.y * blockDim.x + threadIdx.x;
  
    if (i < h && j < w) {
        const int pos = i * s + j;
        shared_normalization_factor[threadIndex] = normalization_factor[pos];
        __syncthreads();

        // Optimize for read access from shared memory
        float scale = shared_normalization_factor[threadIndex];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
        image[pos] *= invScale;
    }
}
```
