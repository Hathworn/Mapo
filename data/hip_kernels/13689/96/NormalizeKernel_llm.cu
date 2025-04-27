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

    // Utilize shared memory to improve performance
    __shared__ float shared_normalization_factor[32][32]; // Adjust size based on maximum block size

    if (i < h && j < w) {
        const int pos = i * s + j;

        shared_normalization_factor[threadIdx.y][threadIdx.x] = normalization_factor[pos]; // Load to shared memory

        __syncthreads(); // Synchronize to ensure all threads have loaded their data

        float scale = shared_normalization_factor[threadIdx.y][threadIdx.x]; // Access from shared memory

        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        image[pos] *= invScale;
    }
}