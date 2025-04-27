#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int totalElements = width * height; // Precompute total elements

    // Access stride-by-stride to improve memory coalescing
    for (unsigned int i = idx; i < totalElements; i += blockDim.x * gridDim.x) {
        tgtMat[i] = mat[i] / vec[i % width]; // Use modulo for correct indexing
    }
}