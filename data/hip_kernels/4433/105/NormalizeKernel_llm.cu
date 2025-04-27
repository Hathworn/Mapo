#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Cache width and height for boundary checks to avoid multiple calculations.
    const int i = threadIdx.y + blockDim.y * blockIdx.y;
    const int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Use shared memory to reduce global memory accesses.
    __shared__ float shared_norm_factor[32][32]; // Assuming block size max 32x32, adjust as needed.

    if (i < h && j < w) {
        const int pos = i * s + j;

        // Load normalization factors into shared memory.
        shared_norm_factor[threadIdx.y][threadIdx.x] = normalization_factor[pos];
        __syncthreads();

        float scale = shared_norm_factor[threadIdx.y][threadIdx.x];

        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        image[pos] *= invScale;
    }
}