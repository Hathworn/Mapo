#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBiggerThanColVector(float* mat, float* vec, float* tgtMat, const int width, const int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Optimize loop unrolling for better warp execution and memory access efficiency
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        unsigned int vecIndex = i / width;  // Calculate once and reuse
        tgtMat[i] = mat[i] > vec[vecIndex];
    }
}