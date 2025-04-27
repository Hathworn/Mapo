#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void confidenceTransformKernel(const int width, const int height, const float threshold, const float gamma, const float clampedValue, const float* inputConfidence, float* outputConfidence) {
    // Calculate global thread coordinates
    uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Exit if thread is out of bounds
    if (x >= width || y >= height) return;
    
    // Compute flattened index
    uint32_t index = y * width + x;
    
    // Load input value from global memory
    float inputValue = inputConfidence[index];
    
    // Apply confidence transformation
    outputConfidence[index] = (inputValue < threshold) ? 0.0f : powf(inputValue, gamma);
}