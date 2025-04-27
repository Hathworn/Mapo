#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExpandAndAdd(float* source, float* mat, float* indices, float* target, int width, int height, float mult, int width2) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Optimize by reducing repetitive calculations
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        const int row = i / height;
        const int column = i % height;
        const int pos = height * static_cast<int>(indices[row]) + column;
        
        // Simplify target assignment using ternary operator
        target[i] = (pos < height * width2) ? (source[i] + mult * mat[pos]) : NAN;
    }
}