#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    const unsigned int col = idx % width; // Calculate column index
    const unsigned int row = idx / width; // Calculate row index
    
    // Process using grid-stride loop
    for (unsigned int i = row; i < height; i += blockDim.x * gridDim.x) {
        unsigned int elementIdx = i * width + col;
        tgtMat[elementIdx] = mat[elementIdx] * vec[i];
    }
}