#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void initialize(float* matrix, float sr, int numFrames, int length) {
    int frame = blockIdx.y * blockDim.y + threadIdx.y;
    int chan  = (blockIdx.x * blockDim.x + threadIdx.x) << 1;
    if (frame < numFrames && chan < length) {
        int index = frame * length + chan; // Calculate index once
        matrix[index] = 0.0f;
        matrix[index + 1] = chan * sr / (length - 2.0f); // Use float division for consistency
    }
}