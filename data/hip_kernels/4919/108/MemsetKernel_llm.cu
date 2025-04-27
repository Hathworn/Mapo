#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}
__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Use cooperative grid-stride loop for improved memory access pattern
    for (int row = i; row < h; row += gridDim.y * blockDim.y) {
        for (int col = j; col < w; col += gridDim.x * blockDim.x) {
            int pos = row * w + col;
            image[pos] = value;
        }
    }
}