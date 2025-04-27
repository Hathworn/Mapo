#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void changeValues(float *matrix, int size) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Check if index is within bounds and handle warp divergence
    if (index < size) {
        float value = matrix[index] * 10;

        // Directly cast without using extra variable 'b'
        matrix[index] = static_cast<float>(static_cast<int>(value));
    }
}