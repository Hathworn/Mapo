#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float* image) {
    // Optimize memory accesses by using blockDim.y and blockDim.x directly
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory when possible or reduce register pressure
    if (i < h && j < w) {
        const int pos = i * w + j;
        image[pos] = value;
    }
}