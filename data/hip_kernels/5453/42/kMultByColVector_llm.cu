#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads in the grid
    const unsigned int stride = blockDim.x * gridDim.x;
    unsigned int colIndex, rowIndex;

    // Loop over elements with strided access pattern
    for (unsigned int i = idx; i < width * height; i += stride) {
        rowIndex = i % height;  // Calculate row index
        tgtMat[i] = mat[i] * vec[rowIndex];  // Multiply by corresponding vector element
    }
}