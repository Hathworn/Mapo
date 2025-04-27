#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByRowVectorScale(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height, float scale_targets) {
    // Calculate the global linear index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate the total number of threads
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    // Optimize by reducing number of multiplications inside the loop
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        unsigned int rowIdx = i / width; // Calculate row index
        tgtMat[i] = scale_targets * tgtMat[i] + mat[i] * vec[rowIdx];
    }
}