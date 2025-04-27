#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate flat index for the matrix element
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with grid-stride to cover all elements
    for (unsigned int i = idx; i < width * height; i += gridDim.x * blockDim.x) {
        // Efficient indexing to access columns divided by corresponding vector element
        tgtMat[i] = mat[i] / vec[i % height];
    }
}