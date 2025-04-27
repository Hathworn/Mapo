#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Use shared memory to reduce global memory access
    __shared__ float shared_scale[32][32]; // Adjust size based on block dimensions

    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    if (i >= h || j >= w) return;

    const int pos = i * s + j;

    // Load normalization factor into shared memory
    shared_scale[threadIdx.y][threadIdx.x] = normalization_factor[pos];
    __syncthreads(); // Synchronize shared memory access

    float scale = shared_scale[threadIdx.y][threadIdx.x];

    float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

    image[pos] *= invScale;
}