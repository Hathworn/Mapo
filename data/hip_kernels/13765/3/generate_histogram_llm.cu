#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_histogram(unsigned int* bins, const float* dIn, const int binNumber, const float lumMin, const float lumMax, const int size) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the current thread's index is within bounds
    if (i >= size) // Changed '>' to '>=' to accurately handle the condition
        return;

    // Precompute reciprocal to avoid division in the loop
    float invRange = 1.0f / (lumMax - lumMin);
    int bin = ((dIn[i] - lumMin) * invRange) * binNumber;

    // Ensure that bin index is within the valid range [0, binNumber-1]
    bin = max(0, min(bin, binNumber - 1)); // Avoid possible out-of-bounds access

    atomicAdd(&bins[bin], 1);
}