#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    const unsigned int rowStart = (idx / width) * width; // Pre-calculate row start index

    // Optimize loop by reducing number of arithmetic operations
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        unsigned int rowIndex = i / width;
        tgtMat[i] = mat[i] / vec[rowIndex];
    }
}