#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    // Compute the overall index from block and thread indices
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    const unsigned int numElements = width * height;

    // Loop with a stride for better memory access pattern
    for (unsigned int i = idx; i < numElements; i += stride) {
        // Compute only if within bounds to avoid unnecessary operations
        const unsigned int rowIdx = i / height;
        tgtMat[i] = mat[i] + mult * vec[rowIdx];
    }
}