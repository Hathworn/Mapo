#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MaskByNaN(float* inputImage, float* mask, float* outputImage, int count) {
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    if (id < count) {
        outputImage[id] = (mask[id] == 0.0f) ? NAN : inputImage[id];  // Use ternary operator for simplicity
    }
}