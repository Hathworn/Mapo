#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void gpu_imageSquare(float * out, const float * in, const int width, const int height) {
    // Pre-calculate commonly used values
    const int index = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x + threadIdx.y * width + threadIdx.x;

    // Use grid-stride loop to cover all elements
    for (int idx = index; idx < width * height; idx += blockDim.x * gridDim.x * blockDim.y * gridDim.y) {
        // Ensure index is within the image bounds
        if (idx < width * height) {
            // Perform square operation
            out[idx] = in[idx] * in[idx];
        }
    }
}