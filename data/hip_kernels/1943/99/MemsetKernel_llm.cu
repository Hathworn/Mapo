#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the linear index for the thread
    int pos = threadIdx.y + blockDim.y * blockIdx.y;
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Use shared memory cautiously to improve caching (useful in larger blocks)
    __shared__ float sharedValue;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        sharedValue = value;
    }
    __syncthreads();

    // Boundary check and assignment
    if (pos < h && j < w) {
        image[pos * w + j] = sharedValue; // Strided write for coalesced memory access
    }
}