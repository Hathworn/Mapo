#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MaskByNaN(float* inputImage, float* mask, float* outputImage, int count) {
    // Calculate global thread ID more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 

    // Check if thread ID is within the bounds
    if (id < count) {
        // Apply masking logic
        outputImage[id] = (mask[id] == 0.0f) ? NAN : inputImage[id];
    }
}