#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Compute unique global index for the thread
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int globalIdy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the index is within bounds
    if (globalIdy < h && globalIdx < w) {
        const int pos = globalIdy * s + globalIdx;

        float scale = normalization_factor[pos];
        float invScale = (scale == 0.0f) ? 1.0f : __fdividef(1.0f, scale); // Use faster division

        image[pos] *= invScale; // Normalize the image pixel
    }
}