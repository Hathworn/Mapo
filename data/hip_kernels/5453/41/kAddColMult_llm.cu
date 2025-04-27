#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    // Calculate thread's linear index within the grid
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads across grid
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    // Use a more precise unsigned long for loop variable to support large matrices
    for (unsigned long i = idx; i < static_cast<unsigned long>(width) * height; i += numThreads) {
        // Precompute index for better efficiency
        unsigned int colIdx = i % height;
        tgtMat[i] = mat[i] + mult * vec[colIdx];
    }
}