#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MaskInput(float* image, float* mask, float* maskedValues, float* output, int count) {
    // Calculate the unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure ID is within the bounds of 'count'
    if (id < count) {
        // Perform computations in one step for efficiency
        output[id] = fmaf(mask[id], image[id] - maskedValues[id], maskedValues[id]);
    }
}