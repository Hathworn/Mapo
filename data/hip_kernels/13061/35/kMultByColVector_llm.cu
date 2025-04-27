#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate the row and column indices
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Loop over columns in a stride pattern
    for (unsigned int i = col; i < width; i += stride) {
        for (unsigned int j = 0; j < height; ++j) {
            unsigned int idx = j * width + i; // Linear index
            tgtMat[idx] = mat[idx] * vec[j]; // Use row index to access vec
        }
    }
}