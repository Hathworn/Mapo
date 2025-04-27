#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kMultByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate linear index based on block and thread indices
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Total number of threads

    // Iterate over matrix elements in a strided pattern
    for (unsigned int i = idx; i < width * height; i += stride) {
        unsigned int row = i % height; // Determine the current row
        tgtMat[i] = mat[i] * vec[row]; // Multiply the matrix element by corresponding vector element
    }
}