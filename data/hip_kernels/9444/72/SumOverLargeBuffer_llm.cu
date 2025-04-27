#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumOverLargeBuffer(float* buffer, int spread, int size) {
    int offset = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (offset + spread < size) { // Ensure within bounds
        buffer[offset] += buffer[offset + spread]; // Direct in-place addition
    }
}