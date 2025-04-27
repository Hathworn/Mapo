#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image) {
    // Calculate linear thread index from 2D block and grid dimensions
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit for threads outside the boundaries
    if (idx >= w || idy >= h) return;

    // Compute the global linear index
    int pos = idy * w + idx;

    // Set the image value
    image[pos] = value;
}