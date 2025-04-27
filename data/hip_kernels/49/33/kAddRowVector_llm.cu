#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height, float scaleVec) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    const unsigned int numElements = width * height;

    // Process using stride loop to cover entire data set
    for (unsigned int i = idx; i < numElements; i += numThreads) {
        tgtMat[i] = mat[i] + scaleVec * vec[i % width];
    }
}