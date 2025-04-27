#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExpand(float* source, float* indices, float* target, int height, int width, int target_width) {
    // Calculate global thread index and total number of threads
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Iterate with stride pattern to improve coalesced memory access
    for (unsigned int i = idx; i < target_width * height; i += numThreads) {
        const int index = static_cast<int>(indices[i / height]);
        const int pos = height * index + i % height;

        // Use ternary operator for improved readability
        target[i] = (pos < height * width) ? source[pos] : __int_as_float(0x7f800000);  // Use __int_as_float for infinity
    }
}