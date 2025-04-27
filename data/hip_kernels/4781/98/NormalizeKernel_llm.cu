#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    // Use shared memory for better memory access patterns
    extern __shared__ float shared_scale[];

    int i = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    if (i < h && j < w) {
        const int pos = i * s + j;
        // Load normalization factor to shared memory
        shared_scale[threadIdx.y * blockDim.x + threadIdx.x] = normalization_factor[pos];
        __syncthreads(); // Ensure all threads have loaded their parts

        float scale = shared_scale[threadIdx.y * blockDim.x + threadIdx.x];
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);
        image[pos] *= invScale;
    }
}