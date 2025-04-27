#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel: Use 2D grid indices and better index calculation
__global__ void MaskInput(float* image, float* mask, float* maskedValues, float* output, int count) {
    // Calculate unique global thread index efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    if (id < count) {
        // Perform mask input operation
        float maskValue = mask[id];
        output[id] = image[id] * maskValue + maskedValues[id] * (1.0f - maskValue);
    }
}