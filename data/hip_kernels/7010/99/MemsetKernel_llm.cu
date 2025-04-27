#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i_start = threadIdx.y + blockDim.y * blockIdx.y;
    int stride = blockDim.y * gridDim.y;

    // Optimize by processing multiple rows per thread
    for (int i = i_start; i < h; i += stride) {
        if (j < w) {
            const int pos = i * w + j;
            image[pos] = value;
        }
    }
}