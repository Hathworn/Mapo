#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate the unique thread index
    int tid = blockIdx.y * blockDim.x * blockDim.y * gridDim.x + blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    int totalThreads = w * h;

    // Unroll loop for efficiency
    for (int idx = tid; idx < totalThreads; idx += blockDim.x * blockDim.y * gridDim.x * gridDim.y) {
        int i = idx / w;
        int j = idx % w;
        if (i >= h || j >= w) return;

        const int pos = i * s + j;

        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        image[pos] *= invScale;
    }
}