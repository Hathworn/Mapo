#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExpandAndAdd(float* source, float* mat, float* indices, float* target, int width, int height, float mult, int width2) {
    // Calculate thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to minimize global memory access
    __shared__ float sharedIndices[256]; // Assuming max blockDim.x is 256
    if (threadIdx.x < height)
        sharedIndices[threadIdx.x] = indices[threadIdx.x];

    __syncthreads();

    // Loop with stride to handle larger data
    for (unsigned int i = idx; i < width * height; i += stride) {
        // Pre-calculate position in mat for efficiency
        const int currentIdx = i / height;
        const int posIndex = sharedIndices[currentIdx];
        const int pos = height * posIndex + i % height;
        
        // Conditional check for valid position
        if (pos < height * width2) {
            target[i] = source[i] + mult * mat[pos];
        } else {
            target[i] = NAN; // Use NAN for invalid operations
        }
    }
}