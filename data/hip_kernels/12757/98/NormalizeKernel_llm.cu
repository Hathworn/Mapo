#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for increased read efficiency
    __shared__ float shared_norm[BLOCK_SIZE * BLOCK_SIZE];

    if (i < h && j < w) {
        const int pos = i * s + j;
        
        // Load normalization factor into shared memory
        shared_norm[threadIdx.y * blockDim.x + threadIdx.x] = normalization_factor[pos];
        __syncthreads();

        float scale = shared_norm[threadIdx.y * blockDim.x + threadIdx.x];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        image[pos] *= invScale;
    }
}