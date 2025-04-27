#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Optimized by calculating the row index directly.
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        unsigned int rowIndex = i / width; // Use width for row index calculation
        tgtMat[i] = mat[i] + vec[rowIndex];
    }
}