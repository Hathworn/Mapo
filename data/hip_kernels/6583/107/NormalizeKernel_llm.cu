#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Calculate two-dimensional grid stride.
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Index to access array elements in a flattened manner.
    int stride_j = blockDim.x * gridDim.x;
    int stride_i = blockDim.y * gridDim.y;

    // Stride loop to handle larger input data sets.
    for (int x = i; x < h; x += stride_i) {
        for (int y = j; y < w; y += stride_j) {

            const int pos = x * s + y;

            float scale = normalization_factor[pos];
            float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

            image[pos] *= invScale;
        }
    }
}