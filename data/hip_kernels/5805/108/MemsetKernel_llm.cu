```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Use shared memory and check thread within block bounds for better memory access patterns
    extern __shared__ float sharedImage[];

    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < h && j < w) { // Ensure thread within image dimensions
        int pos = i * w + j;
        sharedImage[threadIdx.y * blockDim.x + threadIdx.x] = value; // Write to shared memory
        __syncthreads(); // Synchronize threads within block
        image[pos] = sharedImage[threadIdx.y * blockDim.x + threadIdx.x]; // Copy from shared to global memory
    }
}