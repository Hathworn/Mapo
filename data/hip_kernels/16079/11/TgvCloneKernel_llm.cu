#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TgvCloneKernel(float* dst, float* src, int width, int height, int stride) {
    // Calculate the global thread index
    int pos = blockIdx.y * blockDim.y * stride + blockIdx.x * blockDim.x + threadIdx.y * stride + threadIdx.x;
    
    // Check if within bounds
    if (pos < width * height) {
        dst[pos] = src[pos];
    }
}