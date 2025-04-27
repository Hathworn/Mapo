#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate global thread position once
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop to cover all elements
    for (; i < h; i += gridDim.y * blockDim.y) {
        for (int jj = j; jj < w; jj += gridDim.x * blockDim.x) {
            const int pos = i * s + jj;

            float scale = normalization_factor[pos];

            float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

            image[pos] *= invScale;
        }
    }
}