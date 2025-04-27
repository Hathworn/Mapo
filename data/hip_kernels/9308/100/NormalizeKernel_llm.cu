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

    // Use shared memory for cooperative loading of normalization_factor
    __shared__ float sharedScale[1024];  // Adjust size based on block size
    int localId = threadIdx.y * blockDim.x + threadIdx.x;

    if (i < h && j < w)
    {
        const int pos = i * s + j;

        // Load scale factor into shared memory
        sharedScale[localId] = normalization_factor[pos];
        __syncthreads();  // Synchronize to ensure complete loading

        // Use shared memory to avoid multiple global memory reads
        float scale = sharedScale[localId];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        image[pos] *= invScale;
    }
}