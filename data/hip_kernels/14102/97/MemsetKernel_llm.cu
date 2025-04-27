#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image) {
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate the linear position
    int pos = idy * w + idx;

    // Check if within bounds
    if (idx < w && idy < h) {
        image[pos] = value;
    }
}