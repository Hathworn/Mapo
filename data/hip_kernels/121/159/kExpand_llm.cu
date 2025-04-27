#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kExpand(float* __restrict__ source, const float* __restrict__ indices, float* __restrict__ target, int height, int width, int target_width) {
    // Calculate global index and number of threads
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Loop through the target elements
    for (unsigned int i = idx; i < target_width * height; i += numThreads) {
        // Calculate position in source array using indices
        const int pos = __fmul_rn(height, __float2int_rn(indices[i / height])) + i % height;

        // Conditional assignment using ternary operator
        target[i] = (pos < height * width) ? source[pos] : __int_as_float(0x7fffffff); // Avoid division by zero for NaN
    }
}