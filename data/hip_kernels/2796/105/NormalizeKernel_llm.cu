#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image) {
    // Calculate the global index for the current thread
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to ensure the thread is within the image dimensions
    if (i < h && j < w) {
        const int pos = i * s + j; // Compute the linear index for the image element

        float scale = normalization_factor[pos]; // Load normalization factor

        // Compute the inverse scale, checking for zero to avoid division by zero
        float invScale = (scale == 0.0f) ? 1.0f : (1.0f / scale);

        // Normalize the image pixel value by the inverse scale
        image[pos] *= invScale;
    }
}