#include "hip/hip_runtime.h"
#include "includes.h"

/// scalar field to upscale
texture<float, hipTextureType2D, hipReadModeElementType> texCoarse;
texture<float2, hipTextureType2D, hipReadModeElementType> texCoarseFloat2;

__global__ void TgvUpscaleFloat2Kernel(int width, int height, int stride, float scale, float2 *out)
{
    // Use shared memory to reduce global memory access for block-wide outputs
    extern __shared__ float2 sharedOut[];

    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < width && iy < height) {
        float x = ((float)ix + 0.5f) / (float)width;
        float y = ((float)iy + 0.5f) / (float)height;

        // Utilize hardware interpolation
        float2 src = tex2D(texCoarseFloat2, x, y);
        float2 scaledSrc;
        scaledSrc.x = src.x * scale;
        scaledSrc.y = src.y * scale;

        // Store the result in shared memory
        int localIndex = threadIdx.x + threadIdx.y * blockDim.x;
        sharedOut[localIndex] = scaledSrc;

        // Wait until all threads have written to shared memory
        __syncthreads();

        // Copy results from shared memory to global memory
        out[ix + iy * stride] = sharedOut[localIndex];
    }
}