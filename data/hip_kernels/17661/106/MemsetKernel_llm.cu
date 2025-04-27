#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image) {
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < h && j < w) { // Combined boundary check for better readability
        int pos = i * w + j; // Use int instead of const to avoid unnecessary storage optimization
        image[pos] = value; // Assign value if within bounds
    }
}