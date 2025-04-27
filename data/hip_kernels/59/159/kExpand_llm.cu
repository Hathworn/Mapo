#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExpand(float* source, float* indices, float* target, int height, int width, int target_width) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Pre-compute total number of elements
    const unsigned int total = target_width * height;

    // Use a stride loop to allow for coalesced memory access
    for (unsigned int i = idx; i < total; i += blockDim.x * gridDim.x) {
        // Calculate position in source array
        const int pos = height * static_cast<int>(indices[i / height]) + (i % height);

        // Ensure valid memory access; else assign NaN
        target[i] = (pos < height * width) ? source[pos] : __hiloint2float(0x7fffffff, 0x7fffffff);
    }
}