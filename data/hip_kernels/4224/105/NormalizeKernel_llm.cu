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

    // Use shared memory to reduce global memory access
    __shared__ float shared_scale[BLOCK_DIM_X][BLOCK_DIM_Y];

    if (i < h && j < w) {  // Combine conditions for efficiency
        const int pos = i * s + j;

        // Load normalization factor into shared memory
        shared_scale[threadIdx.y][threadIdx.x] = normalization_factor[pos];
        __syncthreads();  // Ensure all threads have loaded data

        float scale = shared_scale[threadIdx.y][threadIdx.x];

        // Avoid branch, use conditional in calculation
        image[pos] *= (scale != 0.0f) ? (1.0f / scale) : 1.0f;
    }
}