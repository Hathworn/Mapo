#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void squeeze(float *B, int dim, int length, float L, float M) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within the bounds
    if (index < dim) {
        index += length; // Offset index by length
        float value = B[index];
        // Apply transformation
        B[index] = 1.0f / (1.0f + __expf(-L * (value - M)));
    }
}